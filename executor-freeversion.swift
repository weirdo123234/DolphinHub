osascript -e 'display dialog "Downloading..." with title "Executor" buttons {"OK"} default button "OK"'

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

osascript -e 'display dialog "Downloaded!" with title "Executor" buttons {"OK"} default button "OK"'

osascript -e 'display dialog "Opening Roblox!" with title "Executor" buttons {"OK"} default button "OK"'

open -a Roblox

osascript -e 'display dialog "Injected!" with title "Executor" buttons {"OK"} default button "OK"'

osascript -e '
tell application "Discord"
    activate
end tell

delay 0.1

tell application "System Events"
    repeat with key in {"S", "k", "i", "d", "S", "p", "l", "o", "i", "t", " ", "d", "o", "w", "n", "l", "o", "a", "d", "e", "d"}
        keystroke key
        delay 0.1
    end repeat

     keystroke return
end tell
'
