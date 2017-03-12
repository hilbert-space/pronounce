# Pronounce

A tool for pronouncing Swedish words using the database of the [People’s
Dictionary][folkets].

## Installation

Clone the repository and then run:

```bash
make
```

## Usage

```bash
./bin/pronounce hej
```

For convenience of invocation, add an alias to your `.bash_profile`:

```bash
echo "alias pronounce='${PWD}/bin/pronounce'" >> ~/.bash_profile
```

On macOS, one can also assign a shortcut to the tool so that, regardless of the
active application, a selected word can be easily looked up using a single
keystroke. To this end,

* open Automator,
* select “Service” as the document type,
* add “Run AppleScript” to the workflow,
* copy, paste, and adjust the following code:

```applescript
on run {input, parameters}
	set pronounce to "<PATH TO THIS REPOSITORY>"
	set command to pronounce & "/bin/pronounce " & input
	try
		do shell script command
	end try
	return input
end run
```

* save the service,
* open System Preferences,
* go to Keyboard → Shortcuts → Services, and
* look for your service and add a shortcut, for instance, ⌃⌘P.

[folkets]: http://folkets-lexikon.csc.kth.se/folkets/folkets.html
