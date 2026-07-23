---
description: Clear iTerm2 badge
allowed-tools: Bash
disable-model-invocation: true
---
!`if [ -n "$TMUX" ]; then out=$(tmux display-message -p '#{pane_tty}'); printf '\ePtmux;\e\e]1337;SetBadgeFormat=\a\e\\' > "$out"; else t=$(ps -o tty= -p $PPID | tr -d ' '); if [ -n "$t" ] && [ "$t" != "??" ]; then printf '\e]1337;SetBadgeFormat=\a' > "/dev/$t"; else echo "no tty found"; exit 0; fi; fi; echo "badge cleared"`

The iTerm2 badge has been cleared (this command ignores any arguments; it never sets a badge). Confirm to the user in one short line that the badge was CLEARED. Do nothing else.
