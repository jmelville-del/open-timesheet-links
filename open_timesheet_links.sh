#!/bin/bash
# Fail loudly and log everything
set -e
exec >> "$HOME/Library/Logs/com.weekly.timesheets.debug.log" 2>&1
echo "----- $(date) starting -----"

# LaunchAgents have a tiny PATH; set it explicitly
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# ABSOLUTE paths for every binary we call
OPEN="/usr/bin/open"
OSASCRIPT="/usr/bin/osascript"

BROWSER_APP="Google Chrome"   # or "Safari", "Arc", etc.
LINKS=(
  "https://[A_LINK]"
  "https://[ANOTHER_LINK]"
)

for url in "${LINKS[@]}"; do
  "$OPEN" -a "$BROWSER_APP" "$url"
done

# Bring browser forward; if TCC blocks AppleEvents, ignore the error
"$OSASCRIPT" -e 'tell application "'"$BROWSER_APP"'" to activate' || true
echo "----- $(date) done -----"
