alias_edit() {
  local selected_alias alias_name alias_value new_value

  selected_alias=$(alias | sed 's/^alias //' | sed "s/='/\t/" | sed "s/'$//" | \
    fzf --ansi \
      --reverse \
      --height=70% \
      --border=rounded \
      --delimiter='\t' \
      --preview 'echo "Current definition:" && echo "" && echo "  {1}={2}" | sed "s/^/  /" && echo "" && echo "💡 Press Enter to edit this alias"' \
      --preview-window=up:6:wrap \
      --header="🔧 Select an alias to edit (or press ESC to cancel)" \
      --prompt="search alias> " \
      --pointer="▶" \
      --marker="✓" \
      --color="header:italic:underline,fg+:cyan,bg+:black,pointer:red,marker:green,prompt:cyan,hl:yellow,hl+:yellow" \
      --bind="ctrl-/:toggle-preview" \
      --bind="alt-up:preview-up,alt-down:preview-down" \
      --header-lines=0)

  if [[ -n "$selected_alias" ]]; then
    alias_name=$(echo "$selected_alias" | cut -f1)
    alias_value=$(echo "$selected_alias" | cut -f2-)

    echo "🎯 Editing alias: $alias_name"
    echo "📝 Current value: $alias_value"
    echo ""

    local edit_value="$alias_value"
    echo -n "✏️  New value: "
    vared -p "" edit_value

    if [[ "$edit_value" != "$alias_value" ]] && [[ -n "$edit_value" ]]; then
      unalias "$alias_name" 2>/dev/null
      alias "$alias_name=$edit_value"

      echo ""
      echo "✅ Alias updated successfully!"
      echo "   $alias_name='$edit_value'"

      echo ""
      read "save?💾 Save to ~/.zshrc? (y/N): "
      if [[ "$save" == "y" || "$save" == "Y" ]]; then
        if [[ -f ~/.zshrc ]]; then
          sed -i.bak "/^alias $alias_name=/d" ~/.zshrc
        fi
        echo "alias $alias_name='$edit_value'" >> ~/.zshrc
        echo "📁 Saved to ~/.zshrc"
      fi
    else
      echo "❌ No changes made or empty value provided"
    fi
  fi
}