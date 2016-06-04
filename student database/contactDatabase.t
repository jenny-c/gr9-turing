import GUI

% declaration section

const BACKGROUND_COLOUR := white
const NUMBER_OF_STUDENTS := 8
const NAME_FILE := "name.text"
const ADDRESS_FILE := "address.text"
const SPACER := 50
const PHONE_NUMBER_FILE := "phoneNumber.text"

var buttonClear : int
var buttonName : int
var buttonQuit : int
var buttonAddress : int
var buttonPhoneNumber : int
var count : int
var defaultFont : int
var nameID : int
var name : int
var addressID : int
var address : int
var searchBar : int
var searchItem : string
var phoneNumberID : int
var phoneNumber : int

defaultFont := Font.New ("Arial :24")

forward procedure closeFiles
forward procedure displayResults
forward procedure displayError (choice : string)
forward procedure drawTitle
forward procedure handleClick
forward procedure initializeGUI
forward procedure openFiles
forward procedure processText (textFromField : string)
forward procedure searchByName
forward procedure searchByAddress
forward procedure searchByPhoneNumber
forward procedure wrapUp


body procedure initializeGUI

	 % declaration section

	 const BUTTON_WIDTH := 125
	 const RUN_WINDOW_TITLE := "Contact Database by J. Chen"

	 var buttonText : string
	 var x : int
	 var y : int


	 setscreen ("graphics: 800; 600, nobuttonbar, title: " + RUN_WINDOW_TITLE)

	 % intialize buttons

	 drawTitle

	 x := BUTTON_WIDTH - SPACER
	 y := maxy - SPACER * 3
	 buttonText := "name"
	 buttonName := GUI.CreateButton (x, y, BUTTON_WIDTH, buttonText, handleClick)

	 x := x + BUTTON_WIDTH + SPACER
	 buttonText := "address"
	 buttonAddress := GUI.CreateButton (x, y, BUTTON_WIDTH, buttonText, handleClick)

	 x := x + BUTTON_WIDTH + SPACER
	 buttonText := "phone #"
	 buttonPhoneNumber := GUI.CreateButton (x, y, BUTTON_WIDTH, buttonText, handleClick)

	 x := x + BUTTON_WIDTH + SPACER
	 buttonText := "clear"
	 buttonClear := GUI.CreateButton (x, y, BUTTON_WIDTH, buttonText, handleClick)

	 y := y - SPACER * 7
	 buttonText := "quit"
	 buttonQuit := GUI.CreateButton (x, y, BUTTON_WIDTH, buttonText, GUI.Quit)


	 % intialize text field

	 x := BUTTON_WIDTH - SPACER
	 y := maxy - SPACER * 4
	 searchBar := GUI.CreateTextField (x, y, BUTTON_WIDTH * 4 + SPACER * 3, "", processText)

end initializeGUI


body procedure closeFiles

	 close : nameID
	 close : addressID
	 close : phoneNumberID

end closeFiles


body procedure displayError (choice : string)

	 GUI.SetBackgroundColour (BACKGROUND_COLOUR)

	 const X := 75
	 const Y := SPACER * 5

	 var errorMessage : string

	 if choice = "name" then

		  errorMessage := "Name not found"
		  Font.Draw (errorMessage, X, Y, defaultFont, blue)

	 elsif choice = "address" then

		  errorMessage := "Address not found"
		  Font.Draw (errorMessage, X, Y, defaultFont, blue)

	 elsif choice = "phoneNumber" then

		  errorMessage := "Phone number not found"
		  Font.Draw (errorMessage, X, Y, defaultFont, blue)

	 else

		  errorMessage := "Search area cannot be blank"
		  Font.Draw (errorMessage, X, Y, defaultFont, blue)

	 end if

	 GUI.SetText (searchBar, "")

	 closeFiles

	 openFiles

	 drawTitle

end displayError


body procedure displayResults

	 var currentName : string
	 var currentAddress : string
	 var currentPhoneNumber : string
	 var lineCounter : int
	 var resultsX : int
	 var resultsY : int

	 lineCounter := 0

	 GUI.SetBackgroundColour (BACKGROUND_COLOUR)

	 closeFiles

	 openFiles

	 loop

		  get : nameID, currentName : *
		  get : addressID, currentAddress : *
		  get : phoneNumberID, currentPhoneNumber : *

		  lineCounter := lineCounter + 1

		  exit when lineCounter >= count

	 end loop

	 resultsX := 75
	 resultsY := 300
	 Font.Draw (currentName, resultsX, resultsY, defaultFont, red)

	 resultsY := resultsY - 70
	 Font.Draw (currentAddress, resultsX, resultsY, defaultFont, red)

	 resultsY := resultsY - 70
	 Font.Draw (currentPhoneNumber, resultsX, resultsY, defaultFont, red)

	 closeFiles

	 openFiles

	 GUI.SetText (searchBar, "")

	 drawTitle

end displayResults


body procedure drawTitle

	 const TITLE := "Welcome to the Contact Database!"

	 var x : int
	 var y : int

	 x := 75
	 y := maxy - 100
	 Font.Draw (TITLE, x, y, defaultFont, black)

end drawTitle


body procedure handleClick

	 var choice : int

	 searchItem := GUI.GetText (searchBar)

	 choice := GUI.GetEventWidgetID

	 if searchItem = "" then

		  displayError ("blank")

	 elsif choice = buttonName then

		  searchByName

	 elsif choice = buttonAddress then

		  searchByAddress

	 elsif choice = buttonPhoneNumber then

		  searchByPhoneNumber

	 else

		  GUI.SetText (searchBar, "")

	 end if

end handleClick


body procedure openFiles

	 open : nameID, NAME_FILE, get, seek
	 open : addressID, ADDRESS_FILE, get, seek
	 open : phoneNumberID, PHONE_NUMBER_FILE, get, seek

end openFiles


body procedure processText (textFromField : string)

	 searchItem := textFromField

end processText


% 3 types of searching

body procedure searchByName

	 var currentName : string

	 count := 0

	 loop

		  if eof (nameID) then

				displayError ("name")
				exit

		  end if

		  get : nameID, currentName : *

		  count := count + 1

		  if currentName = searchItem then

				displayResults

				exit

		  end if

	 end loop

end searchByName


body procedure searchByAddress

	 var currentAddress : string

	 count := 0

	 loop

		  if eof (addressID) then

				displayError ("address")
				exit

		  end if

		  get : addressID, currentAddress : *

		  count := count + 1

		  if currentAddress = searchItem then

				displayResults

				exit

		  end if

	 end loop

end searchByAddress


body procedure searchByPhoneNumber

	 var currentPhoneNumber : string

	 count := 0

	 loop

		  if eof (phoneNumberID) then

				displayError ("phoneNumber")
				exit

		  end if

		  get : phoneNumberID, currentPhoneNumber : *

		  count := count + 1

		  if currentPhoneNumber = searchItem then

				displayResults

				exit

		  end if

	 end loop

end searchByPhoneNumber


body procedure wrapUp

	 GUI.SetBackgroundColour (BACKGROUND_COLOUR)

	 GUI.Dispose (buttonClear)
	 GUI.Dispose (buttonName)
	 GUI.Dispose (buttonAddress)
	 GUI.Dispose (buttonPhoneNumber)
	 GUI.Dispose (buttonQuit)
	 GUI.Dispose (searchBar)

	 Font.Draw ("Thank you for using the Contact Database!", 50, 100, defaultFont, black)

end wrapUp


% main program

initializeGUI

openFiles

loop

	 exit when GUI.ProcessEvent

end loop

wrapUp
