# Usage

Use at your own risk

# open-timesheet-links
A bash script and LaunchAgent config to open timesheet links at a configurable time, for mac

## copy script and launctl plist to mac

Edit `open_timesheet_links.sh` to add the links you want opening

Copy `open_timesheet_links.sh` into `[YOUR_SCRIPTS_DIR]/open_timesheet_links.sh`

Edit `com.weekly.timesheets.plist` by adding your details into the placeholders

Copy `com.weekly.timesheets.plist` to ~/Library/LaunchAgents/com.weekly.timesheets.plist  

## register the launch agent config
```
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.weekly.timesheets.plist
launchctl enable gui/$(id -u)/com.weekly.timesheets
```
## test
```
launchctl kickstart -k gui/$(id -u)/com.weekly.timesheets
```
## view useful debug information
```
launchctl print gui/$(id -u)/com.weekly.timesheets
```
## unregister the launch agent config
```
launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.weekly.timesheets.plist 2>/dev/null
```
