#!/bin/bash
#
# This script is used to determine if the current SSH session should use the
# 1Password SSH Agent. It returns 0 if the agent should be used, and 1 if it
# should not be used.
#
# This script is intended to be used in an SSH configuration file, like so:
#
# ```.ssh/config
# Match Host * Exec "$DOTFILES_DIR/scripts/should-use-opagent.sh"
#   IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
# ```
test -z "$SSH_AUTH_SOCK" || [[ "$SSH_AUTH_SOCK" =~ ^/private/tmp/com.apple.launchd.*/Listeners$ ]]
