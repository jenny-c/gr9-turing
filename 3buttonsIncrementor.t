import GUI

% declaration section

const BUTTON_WIDTH := 150
const X := 100

var button1 : int
var button1Counter : int
var button2 : int
var button2Counter : int
var button3 : int
var button3Counter : int
var buttonQuit : int
var buttonText : string
var spacer : int
var button1Y : int
var button2Y : int
var button3Y : int
var buttonQuitY : int

spacer := 75
button1Y := maxy div 2 + spacer
button2Y := maxy div 2
button3Y := maxy div 2 - spacer
buttonQuitY := maxy div 2 - spacer * 2
button1Counter := 0
button2Counter := 0
button3Counter := 0


forward procedure button1Click
forward procedure button2Click
forward procedure button3Click
forward procedure handleClick
forward procedure initializeGUI
forward procedure wrapUp


body procedure initializeGUI

	 buttonText := "button 1"
	 button1 := GUI.CreateButton (X, button1Y, BUTTON_WIDTH, buttonText, handleClick)

	 buttonText := "button 2"
	 button2 := GUI.CreateButton (X, button2Y, BUTTON_WIDTH, buttonText, handleClick)

	 buttonText := "button 3"
	 button3 := GUI.CreateButton (X, button3Y, BUTTON_WIDTH, buttonText, handleClick)

	 buttonText := "quit"
	 buttonQuit := GUI.CreateButton (X, buttonQuitY, BUTTON_WIDTH, buttonText, GUI.Quit)

end initializeGUI


body procedure button1Click

	 GUI.Dispose (button1)

	 button1Counter := button1Counter + 1

	 button1 := GUI.CreateButton (X, button1Y, BUTTON_WIDTH, intstr (button1Counter), button1Click)

end button1Click


body procedure button2Click

	 GUI.Dispose (button2)

	 button2Counter := button2Counter + 1

	 button2 := GUI.CreateButton (X, button2Y, BUTTON_WIDTH, intstr (button2Counter), button2Click)

end button2Click


body procedure button3Click

	 GUI.Dispose (button3)

	 button3Counter := button3Counter + 1

	 button3 := GUI.CreateButton (X, button3Y, BUTTON_WIDTH, intstr (button3Counter), button3Click)

end button3Click


body procedure handleClick

	 var buttonPressed : int

	 buttonPressed := GUI.GetEventWidgetID

	 if buttonPressed = button1 then

		  button1Click

	 elsif buttonPressed = button2 then

		  button2Click

	 else

		  button3Click

	 end if

end handleClick


body procedure wrapUp

	 cls
	 
	 put "Thanks"

end wrapUp


% main program

initializeGUI

loop

	 exit when GUI.ProcessEvent

end loop

wrapUp
