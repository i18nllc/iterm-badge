---
description: Set iTerm2 badge text
argument-hint: [badge text]
allowed-tools: Bash
disable-model-invocation: true
---
!`b64=$(printf '%s' "$ARGUMENTS" | base64); if [ -n "$TMUX" ]; then out=$(tmux display-message -p '#{pane_tty}'); printf '\ePtmux;\e\e]1337;SetBadgeFormat=%s\a\e\\' "$b64" > "$out"; else t=$(ps -o tty= -p $PPID | tr -d ' '); if [ -n "$t" ] && [ "$t" != "??" ]; then printf '\e]1337;SetBadgeFormat=%s\a' "$b64" > "/dev/$t"; else echo "no tty found"; exit 0; fi; fi; echo "badge set: $ARGUMENTS"`

The iTerm2 badge has been set. Confirm to the user in one short line. Do nothing else.
