import GUI

% declaration section

var buttonQuit : int
var textField : int

forward procedure initializeGUI
forward procedure processText (textFromField : string)


body procedure initializeGUI

	 var placeholderText : string
	 var x : int
	 var y : int

	 x := maxx div 2 - 75
	 y := maxy - 200
	 placeholderText := "name?"
	 textField := GUI.CreateTextField (x, y, 200, placeholderText, processText)

	 y := y - 50
	 buttonQuit := GUI.CreateButton (x, y, 200, "quit", GUI.Quit )

end initializeGUI


body procedure processText (textFromField : string)

	 locate (1, 1)
	 put "hello ", textFromField, "!"

end processText


% main program

initializeGUI

loop

	 exit when GUI.ProcessEvent

end loop
