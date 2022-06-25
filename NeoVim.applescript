on run {input, parameters}
	if input is in {{}, {""}, ""} then
		set cmd to "nvim"
	else
		set myPath to POSIX path of input
		set cmd to "nvim " & quote & myPath & quote
	end if
	
	if application "Alacritty" is running then
		tell application "Alacritty"
			activate
			tell application "System Events"
				keystroke "n" using command down
				delay 0.5
				keystroke cmd
				keystroke return
			end tell
		end tell
	else
		tell application "Alacritty"
			activate
			delay 0.5
			tell application "System Events"
				keystroke cmd
				keystroke return
			end tell
		end tell
	end if
end run
