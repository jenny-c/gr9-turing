import GUI

% declaration section

var quitButton : int
var talkButton : int

forward procedure initializeGUI
forward procedure talk
forward procedure signalCompletion


body procedure initializeGUI

	 % declaration section

	 const BUTTON_WIDTH := 50

	 var text : string
	 var x : int
	 var y : int


	 % Create the required buttons.

	 x := maxy div 2 - BUTTON_WIDTH * 2
	 y := maxy div 2
	 text := "Happy? "
	 talkButton := GUI.CreateButton (x, y, BUTTON_WIDTH, text, talk)

	 x := x + BUTTON_WIDTH * 3
	 text := "Quit"
	 quitButton := GUI.CreateButton (x, y, BUTTON_WIDTH, text, GUI.Quit)

end initializeGUI


body procedure talk

	 put "Happy! " ..

end talk


body procedure signalCompletion

	 cls
	 locate (maxrow div 2, maxcol div 2)
	 put "Done!"

end signalCompletion


% main program

initializeGUI

loop

	 exit when GUI.ProcessEvent

end loop

signalCompletion

