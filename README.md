Run in Terminal (TextMate bundle)
=======================================================================
A simple TextMate 1.5 bundle to run Python, Ruby, PHP, Bash scripts in Terminal.app without stealing focus from the TextMate window. It can easily be modified to run `%YOUR_FAVORITE_LANGUAGE%`. If you added support for a new language, please make a pull request to update this repository or email your changes to the author.

![](https://raw.github.com/Cyberic/Run-in-Terminal-Bundle/master/screenshot.jpg)

Installation
-----------------------------------------------------------------------
1. [Download](https://github.com/Cyberic/Run-in-Terminal-Bundle/archive/master.zip) and extract the archive.
2. Double click “Run in Terminal.tmbundle”. TextMate will then install the bundle.

Usage
-----------------------------------------------------------------------
Press Cmd + Shift + R to run your script. If any other bundles share this hotkey, TextMate will show a pop-up menu where you’d need to select Run in Terminal → Run Python/Ruby/PHP...:

![](http://www.imagocentre.com/images/111/textmate_popup_menu_717.jpg)

If you don’t want this menu to appear, use Bundle Editor to edit out the hotkey from “conflicting” bundles or set a different hotkey for commands in this bundle.

How does it work
-----------------------------------------------------------------------
The bundle uses AppleScript to create (if necessary) a Terminal.app window running a [GNU Screen](http://en.wikipedia.org/wiki/GNU_Screen) session named “TextMate”, which receives commands to run your script. Such a window is internally referenced as an “executor”. After running a script, “executor” displays execution time measured with [Unix `time` command](http://en.wikipedia.org/wiki/Time_%28Unix%29).

For Python projects, the bundle respects `TM_PYTHON` environment variable (if set). If you use virtualenv, set TM_PYTHON to the full path to Python binary inside your virtualenv directory. Note that TextMate does not understand `~/...`, use `/Users/username/...` instead.

Known problems
-----------------------------------------------------------------------
Only tested with TextMate 1.5.11 and Mac OS X 10.8 (“Mountain Lion”).

* Sometimes the “executor” may take up to 30 seconds to initialize while displaying a message saying “New screen”.
* Bash commands used to run scripts are saved in bash history as if a user typed them.

Credits & license
------------------------------------------------------------------------
Written by Eugene ‘Dae’ Zuyev (dae@cyberic.eu).

Any feedback is appreciated. Feel free to use the code under the terms of the MIT License (see LICENSE).