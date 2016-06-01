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
var personFound : boolean
var rollNumberID : int
var rollNumber : int
var searchBar : int
var searchItem : string
var studentNumberID : int
var studentNumber : int

defaultFont := Font.New ("Arial :24:bold")

forward procedure closeFiles
forward procedure displayResults
forward procedure displayError
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
	 y := maxy - 75
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
	 y := maxy - 120
	 searchBar := GUI.CreateTextField (x, y, BUTTON_WIDTH * 4, "", processText)

end initializeGUI


body procedure closeFiles

	 close : nameID
	 close : rollNumberID
	 close : studentNumberID

end closeFiles


body procedure displayError

	 GUI.SetBackgroundColour (BACKGROUND_COLOUR)

	 Font.Draw ("Person not found", 300, 60, defaultFont, blue)
	 
	 GUI.SetText (searchBar, "")

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

end displayResults


body procedure handleClick

	 var choice : int

	 personFound := false

	 searchItem := GUI.GetText (searchBar)

	 choice := GUI.GetEventWidgetID
	 
	 if searchItem = "" then
	 
		  displayError

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

				personFound := true

				exit

		  end if

		  exit when eof (nameID)

	 end loop

	 if personFound = false then

		  displayError

	 end if

end searchByName


body procedure searchByRollNumber

	 var currentRollNumber : string

	 count := 0

	 loop

		  get : rollNumberID, currentRollNumber : *

		  count := count + 1

		  if currentRollNumber = searchItem then

				displayResults

				personFound := true

				exit

		  end if

		  exit when eof (rollNumberID)

	 end loop

	 if personFound = false then

		  displayError

	 end if

end searchByRollNumber


body procedure searchByStudentNumber

	 var currentStudentNumber : string

	 count := 0

	 loop

		  get : studentNumberID, currentStudentNumber : *

		  count := count + 1

		  if currentStudentNumber = searchItem then

				displayResults

				personFound := true

				exit

		  end if

		  exit when eof (studentNumberID)

	 end loop

	 if personFound = false then

		  displayError

	 end if

end searchByStudentNumber


body procedure wrapUp

	 GUI.SetBackgroundColour (BACKGROUND_COLOUR)

	 GUI.Dispose (buttonName)
	 GUI.Dispose (buttonRollNumber)
	 GUI.Dispose (buttonStudentNumber)
	 GUI.Dispose (buttonQuit)
	 GUI.Dispose (searchBar)
	 
	 Font.Draw ("Thank you for using the Student Database!", 1, 1, defaultFont, black)

end wrapUp


% main program

initializeGUI

openFiles

loop

	 exit when GUI.ProcessEvent

end loop

wrapUp
