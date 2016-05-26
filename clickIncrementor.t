import GUI

% declaration section

var clickButton : int
var clickCount : int
var clickCountFont : int
var quitButton : int
var spacer : int
var x : int
var y : int

clickCountFont := Font.New ("Arial :24:bold")
spacer := 100

clickCount := 0


forward procedure incrementAndDisplayClickCount
forward procedure initializeGUI
forward procedure wrapUp


body procedure incrementAndDisplayClickCount

	 var message : string
	  
	 x := maxx div 2
	 y := maxy div 2 + spacer
	  
	 cls
	 
	 clickCount := clickCount + 1
	 
	 message := "click #" + intstr(clickCount)
	 Font.Draw (message, x, y, clickCountFont, blue)

end incrementAndDisplayClickCount


body procedure initializeGUI

	 % declaration section
	 
	 const BUTTON_WIDTH := 120

	 var buttonText : string

	 x := maxx div 2
	 y := maxy div 2
	 buttonText := "Click here!"
	 clickButton := GUI.CreateButton (x, y, BUTTON_WIDTH, buttonText, incrementAndDisplayClickCount)

	 y := y - spacer
	 buttonText := "Quit"
	 quitButton := GUI.CreateButton (x, y, BUTTON_WIDTH, buttonText, GUI.Quit)

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
