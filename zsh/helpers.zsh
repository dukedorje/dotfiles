

upload-plex () {
	rsync -av --progress $1 duke@lenovo.local:/Plex/${2:-Movies}
}

obs-compress () {
	fname=$1
	if [[ $1 != *.mkv ]]; then
		fname=${1%.*}.mkv
	fi
	echo $fname

	ffmpeg -i "$fname" -vf "scale=1280:-2" -c:v libx264 -preset slow -crf 18 -c:a aac -q:a 2 -ar 44100 -ac 1 "${fname%.*}.mp4"
}

wav-compress () {
	fname=$1
	if [[ $1 != *.wav ]]; then
		fname=${1%.*}.wav
	fi
	echo $fname

	ffmpeg -vn -i "$fname" -c:a aac -q:a 2 "${fname%.*}.m4a"
}

opus2m4a() {
    [[ -z "$1" ]] && { echo "Usage: opus2m4a input.opus"; return 1 }
    [[ -f "$1" ]] || { echo "File not found: $1"; return 1 }
    local input="$1"
    local output="${input:r}.m4a"
    ffmpeg -i "$input" -c:a aac_at -q:a 2 "$output"
}


clean-projects () {
	fd -td -u '(target|node_modules|.next|.yarn|.cargo|.venv|dist|build)$' -x echo \; -x rm -rf {}
}

# To create the encrypted file: `gpg --symmetric --cipher-algo AES256 ~/.secret.env && rm ~/.secret.env`
load-secret-env () {
	gpg --decrypt ~/.secret.env.gpg > ~/.secret.env
	source ~/.secret.env
	rm ~/.secret.env
}

yt-aac () {
	[[ -z "$1" ]] && { echo "Usage: yt-aac <youtube_url>"; return 1 }
	yt-dlp --audio-format aac -x "$1"
}

pack() {
  local selected_script

  selected_script=$(cat package.json | jq -r '
    .scripts | to_entries[] |
    "\(.key)\t\(.value)"
  ' | fzf --ansi \
    --reverse \
    --height=50% \
    --border=rounded \
    --preview 'echo {2..} | sed "s/\t/ /g"' \
    --preview-window=up:3:wrap \
    --header="📦 Select which package.json script to run" \
    --prompt="search> " \
    --pointer="▶" \
    --marker="✓" \
    --color="header:italic:underline,fg+:cyan,bg+:black,pointer:red,marker:green,prompt:cyan,hl:yellow,hl+:yellow" \
    --bind="ctrl-/:toggle-preview" \
    --bind="alt-up:preview-up,alt-down:preview-down" \
  | cut -f1)

  if [[ -n "$selected_script" ]]; then
    local cmd
    if [[ -f bun.lockb ]]; then
      echo "⚡ Running with bun: $selected_script"
      cmd="bun run $selected_script"
      bun run "$selected_script"
    elif [[ -f pnpm-lock.yaml ]]; then
      echo "🔧 Running with pnpm: $selected_script"
      cmd="pnpm run $selected_script"
      pnpm run "$selected_script"
    else
      echo "⚡ Running with bun: $selected_script"
      cmd="bun run $selected_script"
      bun run "$selected_script"
    fi
    print -s "$cmd"
  fi
}

spin-serve() {
	spin up --from ghcr.io/fermyon/spin-fileserver:v0.3.0 --files "${1:-.}" --listen 127.0.0.1:${2:-3000}
}
