#!/bin/sh
# Set the iTerm2 badge ($* = text, empty = clear). Safe to call from
# Claude Code hooks or the Bash tool: walks up the process tree to find
# the session's real tty, since these shells have no controlling terminal.
b64=$(printf '%s' "$*" | base64)
if [ -n "$TMUX" ]; then
  printf '\ePtmux;\e\e]1337;SetBadgeFormat=%s\a\e\\' "$b64" > "$(tmux display-message -p '#{pane_tty}')"
  exit 0
fi
p=$PPID
while [ -n "$p" ] && [ "$p" -gt 1 ]; do
  t=$(ps -o tty= -p "$p" | tr -d ' ')
  if [ -n "$t" ] && [ "$t" != "??" ]; then
    printf '\e]1337;SetBadgeFormat=%s\a' "$b64" > "/dev/$t"
    exit 0
  fi
  p=$(ps -o ppid= -p "$p" | tr -d ' ')
done
echo "no tty found"  # headless run — harmless no-op
