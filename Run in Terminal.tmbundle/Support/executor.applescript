property executor : null -- id of executor window

(* Optionally use stty -echo; to hide input mirroring. About echo command: bit.ly/yamWXV - also it turns out to be the fastest way to clear everything. *)
set cmd_reset to "echo -en \"\\033c\";"

on app_is_running(app_name)
	tell application "System Events" to (name of processes) contains app_name
end app_is_running

(* If Terminal is running, check if it already has a executor window - if not, make a new one. If Terminal is not running, launch it. When launching, Terminal automatically creates a new window, so I use that window instead of making a new one. *)
if app_is_running("Terminal") then
	tell application "Terminal"
		-- Check if window actually exists
		if (executor is not null) then
			(*if window id executor exists then
				do script cmd_reset in window id executor
			else
				set executor to null
			end if*)
			
			if not (window id executor exists) then set executor to null
		end if
		
		-- Create a new window
		if (executor is null) then
			(* Due to a bug in Terminal's AppleScript implementation I can't get window id of a tab object, e.g.: "get container of executor", so instead I compare the list of window ids before and after creation of a new window. Very ugly, but hey it works. *)
			set windows_before to id of every window
			set executor to do script -- create a new window
			set windows_after to id of every window
			
			repeat with window_id in windows_after
				if window_id is not in windows_before then set executor to window_id
			end repeat
			
			delay 0.25 -- ensure everything has loaded
			
			set custom title of window id executor to "TextMate"
			do script "screen -dRR TextMate; " & cmd_reset in window id executor
		end if
	end tell
else
	tell application "Terminal"
		activate
		
		delay 0.25 -- ensure everything has loaded
		
		set executor to id of front window
		
		set custom title of window id executor to "TextMate"
		do script "screen -dRR TextMate;" & cmd_reset in window id executor
	end tell
end if