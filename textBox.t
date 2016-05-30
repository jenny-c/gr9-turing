import GUI

% declaration section

var buttonQuit : int
var textBox : int
var textField : int
var textLabel : int

forward procedure initializeGUI
forward procedure processText (textFromField : string)


body procedure initializeGUI

	 var placeholderText : string
	 var width : int
	 var x : int
	 var y : int
	 
	 width := 200
	 
	 x := maxx div 2 - 75
	 y := maxy - 100
	 textField := GUI.CreateTextField (x, y, width, "", processText)

	 y -= 50
	 buttonQuit := GUI.CreateButton (x, y, width, "quit", GUI.Quit)

	 y += 100
	 textLabel := GUI.CreateLabel (x, y, "line?")

	 y -= 300
	 textBox := GUI.CreateTextBox (x, y, width, 150)

end initializeGUI


body procedure processText (textFromField : string)

	 GUI.SetLabel (textLabel, textFromField)

	 GUI.AddLine (textBox, textFromField)

	 GUI.SetText (textField, "")

end processText


% main program

initializeGUI

loop

	 exit when GUI.ProcessEvent

end loop
