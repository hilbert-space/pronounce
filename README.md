# Pronunciation

A command-line tool for pronouncing Swedish words using the database of the
[People’s Dictionary][folkets].

## Installation

```bash
make
```

For convenience of invocation, add the `bin` directory to your `PATH`:

```bash
echo "export PATH=\$PATH:`pwd`/bin" >> ~/.bash_profile
```

On OS X, one can also assign a shortcut to the tool so that a selected word can
be looked up a single keystroke regardless of the active application. To this
end,

* open Automator,
* select “Service” as the document type,
* add “Run AppleScript” to the workflow,
* copy, paste, and adjust the following code:

```applescript
on run {input, parameters}
	set pronounce to "[LOCAL_PATH_TO_THIS_REPOSITORY]/bin/pronounce"
	set command to pronounce & " " & input
	try
		do shell script command
	end try
	return input
end run
```

* save the service,
* open System Preferences,
* go to Keyboard → Shortcuts → Services, and
* look for your service and add a shortcut.

[folkets]: http://folkets-lexikon.csc.kth.se/folkets/folkets.html
