

# Keycloak API helper functions

# Global vars for token caching
KEYCLOAK_ACCESS_TOKEN=""
KEYCLOAK_TOKEN_EXPIRES=""

# Get or refresh access token if needed
keycloak_get_token() {
  local current_time=$(/bin/date +%s)
  
  # Check if token exists and hasn't expired (with 60s buffer)
  if [[ -n "$KEYCLOAK_ACCESS_TOKEN" && -n "$KEYCLOAK_TOKEN_EXPIRES" ]]; then
    if (( current_time < (KEYCLOAK_TOKEN_EXPIRES - 60) )); then
      return 0
    fi
  fi
  
  # Fetch new token
  local response=$(/usr/bin/curl -s -X POST "https://connect.identikey.io/realms/master/protocol/openid-connect/token" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "grant_type=password" \
    -d "client_id=admin-cli" \
    -d "username=$KEYCLOAK_ADMIN_USERNAME" \
    -d "password=$KEYCLOAK_ADMIN_PASSWORD")
  
  KEYCLOAK_ACCESS_TOKEN=$(echo "$response" | /usr/bin/jq -r '.access_token')
  local expires_in=$(echo "$response" | /usr/bin/jq -r '.expires_in')
  
  if [[ "$KEYCLOAK_ACCESS_TOKEN" == "null" || -z "$KEYCLOAK_ACCESS_TOKEN" ]]; then
    echo "Error: Failed to get access token" >&2
    return 1
  fi
  
  KEYCLOAK_TOKEN_EXPIRES=$((current_time + expires_in))
  echo "Got new Keycloak access token (expires in ${expires_in}s)" >&2
}

# Generic API call function
keycloak_api() {
  local method="$1"
  local path="$2"
  local data="$3"
  
  if [[ -z "$method" || -z "$path" ]]; then
    echo "Usage: keycloak_api <METHOD> <path> [data]" >&2
    echo "Example: keycloak_api GET /admin/realms/master/events" >&2
    return 1
  fi
  
  keycloak_get_token || return 1
  
  local curl_args=(
    -s
    -X "$method"
    "https://connect.identikey.io$path"
    -H "Authorization: Bearer $KEYCLOAK_ACCESS_TOKEN"
    -H "Content-Type: application/json"
  )
  
  if [[ -n "$data" ]]; then
    curl_args+=(-d "$data")
  fi
  
  /usr/bin/curl "${curl_args[@]}" | /usr/bin/jq .
}

# Query login error events
keycloak_get_login_errors() {
  keycloak_api GET "/admin/realms/master/events?type=CLIENT_LOGIN_ERROR"
}

# Enable events logging
keycloak_enable_events() {
  keycloak_api PUT "/admin/realms/master" '{"eventsEnabled": true, "eventsExpiration": 43200}'
}
