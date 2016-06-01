import GUI
setscreen ("graphics: 800, 600")

% declaration section

const BACKGROUND_COLOUR := white
const NUMBER_OF_STUDENTS := 8
const NAME_FILE := "name.text"
const ROLL_NUMBER_FILE := "rollNumber.text"
const STUDENT_NUMBER_FILE := "studentNumber.text"

var buttonName : int
var buttonQuit : int
var buttonRollNumber : int
var buttonStudentNumber : int
var count : int
var defaultFont : int
var nameID : int
var name : int
var rollNumberID : int
var rollNumber : int
var searchBar : int
var searchItem : string
var studentNumberID : int
var studentNumber : int

defaultFont := Font.New ("Arial :24:bold")

forward procedure closeFiles
forward procedure displayResults
forward procedure displayError (choice : string)
forward procedure handleClick
forward procedure initializeGUI
forward procedure openFiles
forward procedure processText (textFromField : string)
forward procedure searchByName
forward procedure searchByRollNumber
forward procedure searchByStudentNumber
forward procedure wrapUp


body procedure initializeGUI

	 % declaration section

	 const BUTTON_WIDTH := 150

	 var buttonText : string
	 var x : int
	 var y : int


	 % intialize buttons
	 
	 x := 60
	 y := maxy - 100
	 Font.Draw ("Welcome to the Student Database!", x, y, defaultFont, black)

	 y := maxy - 150
	 buttonText := "name"
	 buttonName := GUI.CreateButton (x, y, BUTTON_WIDTH, buttonText, handleClick)

	 x := x + 150
	 buttonText := "roll"
	 buttonRollNumber := GUI.CreateButton (x, y, BUTTON_WIDTH, buttonText, handleClick)

	 x := x + 150
	 buttonText := "student #"
	 buttonStudentNumber := GUI.CreateButton (x, y, BUTTON_WIDTH, buttonText, handleClick)

	 x := x + 150
	 buttonText := "quit"
	 buttonQuit := GUI.CreateButton (x, y, BUTTON_WIDTH, buttonText, GUI.Quit)


	 % intialize text field

	 x := 60
	 y := maxy - 200
	 searchBar := GUI.CreateTextField (x, y, BUTTON_WIDTH * 4, "", processText)

end initializeGUI


body procedure closeFiles

	 close : nameID
	 close : rollNumberID
	 close : studentNumberID

end closeFiles


body procedure displayError (choice : string)

	 GUI.SetBackgroundColour (BACKGROUND_COLOUR)

	 if choice = "name" then

		  Font.Draw ("Name not found", 300, 60, defaultFont, blue)

	 elsif choice = "rollNumber" then

		  Font.Draw ("Roll number must be between 1 - " + intstr (NUMBER_OF_STUDENTS), 300, 60, defaultFont, blue)

	 elsif choice = "studentNumber" then

		  Font.Draw ("Student number not found", 300, 60, defaultFont, blue)

	 else

		  Font.Draw ("Search area cannot be blank.", 300, 60, defaultFont, blue)

	 end if

	 GUI.SetText (searchBar, "")
	 
	 initializeGUI

end displayError


body procedure displayResults

	 var currentName : string
	 var currentRollNumber : string
	 var currentStudentNumber : string
	 var lineCounter : int
	 var resultsX : int
	 var resultsY : int

	 lineCounter := 0

	 GUI.SetBackgroundColour (BACKGROUND_COLOUR)

	 closeFiles

	 openFiles

	 loop

		  get : nameID, currentName : *
		  get : rollNumberID, currentRollNumber : *
		  get : studentNumberID, currentStudentNumber : *

		  lineCounter := lineCounter + 1

		  exit when lineCounter >= count

	 end loop

	 resultsX := 60
	 resultsY := 300
	 Font.Draw (currentName, resultsX, resultsY, defaultFont, red)

	 resultsY := resultsY - 70
	 Font.Draw (currentRollNumber, resultsX, resultsY, defaultFont, red)

	 resultsY := resultsY - 70
	 Font.Draw (currentStudentNumber, resultsX, resultsY, defaultFont, red)

	 closeFiles

	 openFiles

	 GUI.SetText (searchBar, "")
	 
	 initializeGUI

end displayResults


body procedure handleClick

	 var choice : int

	 searchItem := GUI.GetText (searchBar)

	 choice := GUI.GetEventWidgetID

	 if searchItem = "" then

		  displayError ("blank")

	 elsif choice = buttonName then

		  searchByName

	 elsif choice = buttonRollNumber then

		  searchByRollNumber

	 else

		  searchByStudentNumber

	 end if

end handleClick


body procedure openFiles

	 open : nameID, NAME_FILE, get
	 open : rollNumberID, ROLL_NUMBER_FILE, get
	 open : studentNumberID, STUDENT_NUMBER_FILE, get

end openFiles


body procedure processText (textFromField : string)

	 searchItem := textFromField

end processText


% 3 types of searching

body procedure searchByName

	 var currentName : string

	 count := 0

	 loop

		  get : nameID, currentName : *

		  count := count + 1

		  if currentName = searchItem then

				displayResults

				exit

		  end if

		  if eof (nameID) then

				displayError ("name")
				exit

		  end if

	 end loop

end searchByName


body procedure searchByRollNumber

	 var currentRollNumber : string

	 count := 0

	 loop

		  get : rollNumberID, currentRollNumber : *

		  count := count + 1

		  if currentRollNumber = searchItem then

				displayResults

				exit

		  end if

		  if eof (rollNumberID) then

				displayError ("rollNumber")
				exit

		  end if

	 end loop

end searchByRollNumber


body procedure searchByStudentNumber

	 var currentStudentNumber : string

	 count := 0

	 loop

		  get : studentNumberID, currentStudentNumber : *

		  count := count + 1

		  if currentStudentNumber = searchItem then

				displayResults

				exit

		  end if

		  if eof (studentNumberID) then

				displayError ("studentNumber")
				exit

		  end if

	 end loop

end searchByStudentNumber


body procedure wrapUp

	 GUI.SetBackgroundColour (BACKGROUND_COLOUR)

	 GUI.Dispose (buttonName)
	 GUI.Dispose (buttonRollNumber)
	 GUI.Dispose (buttonStudentNumber)
	 GUI.Dispose (buttonQuit)
	 GUI.Dispose (searchBar)

	 Font.Draw ("Thank you for using the Student Database!", 50, 100, defaultFont, black)

end wrapUp


% main program

initializeGUI

openFiles

loop

	 exit when GUI.ProcessEvent

end loop

wrapUp
