TERMINAL="ghostty" # Change to your preferred terminal, e.g., "kitty", "gnome-terminal", etc.
SESSION=">_"
SHELL="zsh"

$TERMINAL -e $SHELL -c "
if ! tmux has-session -t \"$SESSION\" 2>/dev/null; then
  tmux new-session -d -s \"$SESSION\"
else
  tmux new-window -t \"$SESSION\"
fi
tmux attach-session -t \"$SESSION\"
exec $SHELL
"
