import GUI
setscreen ("graphics: 800, 500")

% declaration section

var backgroundColour : int
var fontBody : int
var printButton : int
var quitButton : int
var x : int
var y : int

fontBody := Font.New ("Times::")

forward procedure initializeGUI
forward procedure handleClick
forward procedure wrapUp


body procedure initializeGUI

	 const BUTTON_WIDTH := 50

	 var buttonText : string

	 backgroundColour := white

	 x := maxx div 2 + BUTTON_WIDTH
	 y := maxy div 2
	 buttonText := "Print a random line"
	 printButton := GUI.CreateButton (x, y, BUTTON_WIDTH, buttonText, handleClick)

	 y := maxy div 2 - BUTTON_WIDTH * 2
	 buttonText := "Quit"
	 quitButton := GUI.CreateButton (x, y, BUTTON_WIDTH, buttonText, GUI.Quit)

end initializeGUI


body procedure handleClick

	 var number : int
	 var randomLine : array 1 .. * of string := init ("Hello", "How are you?", "I like food")

	 x := 100
	 y := 100

	 GUI.SetBackgroundColour (backgroundColour)

	 randint (number, 1, upper (randomLine))

	 Font.Draw (randomLine (number), x, y, fontBody, red)

end handleClick


body procedure wrapUp

	 const thankYouMessage := "Thank you!"
	 
	 x := 100
	 y := 100

	 GUI.Dispose (printButton)
	 GUI.Dispose (quitButton)
	 
	 GUI.SetBackgroundColour (backgroundColour)
	 
	 Font.Draw (thankYouMessage, x, y, fontBody, black)

end wrapUp


% main program

initializeGUI

loop

	 exit when GUI.ProcessEvent 

end loop

wrapUp
