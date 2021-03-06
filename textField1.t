import GUI

% declaration section

var buttonQuit : int
var textField : int
var textFieldLabel : int
var x : int
var y : int

forward procedure initializeGUI
forward procedure processText (textFromField : string)


body procedure initializeGUI

	 var placeholderText : string

	 x := maxx div 2 - 75
	 y := maxy - 200
	 textField := GUI.CreateTextField (x, y, 200, "", processText)

	 y := y - 50
	 buttonQuit := GUI.CreateButton (x, y, 200, "quit", GUI.Quit)

	 y += 100
	 textFieldLabel := GUI.CreateLabel (x, y, "name?")

end initializeGUI


body procedure processText (textFromField : string)

	 GUI.SetLabel (textFieldLabel, "hello " + textFromField + "!")

	 GUI.SetText (textField, "")

end processText


% main program

initializeGUI

loop

	 exit when GUI.ProcessEvent

end loop
