osascript -e 'display dialog "You think you can get an executor for free?" with title "Executor" buttons {"YES", "NO"} default button "YES"'

osascript -e '
tell application "Discord"
    activate
end tell

delay 0.1

tell application "System Events"
    repeat with key in {"I", "m", " ", "a", " ", "s", "k", "i", "d", "!"}
        keystroke key
        delay 0.1
    end repeat

     keystroke return
end tell
'

open -a Terminal
