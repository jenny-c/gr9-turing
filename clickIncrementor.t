import GUI

% declaration section

var clickButton : int
var clickCount : int
var quitButton : int

clickCount := 0


forward procedure incrementAndDisplayClickCount
forward procedure initializeGUI
forward procedure wrapUp


body procedure incrementAndDisplayClickCount

	 cls

	 clickCount := clickCount + 1

	 put "click #", clickCount

end incrementAndDisplayClickCount


body procedure initializeGUI

	 % declaration section

	 var buttonText : string
	 var spacer : int
	 var x : int
	 var y : int

	 spacer := 100

	 x := maxx div 2
	 y := maxy div 2
	 buttonText := "Click here!"
	 clickButton := GUI.CreateButton (x, y, 0, buttonText, incrementAndDisplayClickCount)

	 y := y - spacer
	 buttonText := "Quit"
	 quitButton := GUI.CreateButton (x, y, 0, buttonText, GUI.Quit)

end initializeGUI


body procedure wrapUp

	 cls

	 put "Thank you!"

end wrapUp


% main program

loop

	 initializeGUI

	 exit when GUI.ProcessEvent

end loop

wrapUp
