import GUI

% declaration section

const ADDRESS_FILE := "address.text"
const BACKGROUND_COLOUR := white
const NAME_FILE := "name.text"
const NUMBER_OF_CONTACTS := 8
const PHONE_NUMBER_FILE := "phoneNumber.text"
const SPACER := 50

var address : int
var addressID : int
var buttonAddress : int
var buttonClear : int
var buttonName : int
var buttonPhoneNumber : int
var buttonQuit : int
var count : int
var defaultFont : int
var location : int
var name : int
var nameID : int
var phoneNumber : int
var phoneNumberID : int
var picture : array 1 .. NUMBER_OF_CONTACTS of int
var searchBar : int
var searchItem : string

defaultFont := Font.New ("Arial :24")

forward procedure closeFiles
forward procedure displayError (choice : int)
forward procedure displayResults
forward procedure drawTitle
forward procedure handleClick
forward procedure initializeGUI
forward procedure initializePicture
forward procedure openFiles
forward procedure processText (textFromField : string)
forward procedure search (userChoice : int, fileID : int)
forward procedure wrapUp


body procedure closeFiles

	 close : nameID
	 close : addressID
	 close : phoneNumberID

end closeFiles


body procedure displayError (choice : int)

	 GUI.SetBackgroundColour (BACKGROUND_COLOUR)

	 const X := 75
	 const Y := SPACER * 5

	 var errorMessage : string

	 if choice = buttonName then

		  errorMessage := "Name not found"
		  Font.Draw (errorMessage, X, Y, defaultFont, blue)

	 elsif choice = buttonAddress then

		  errorMessage := "Address not found"
		  Font.Draw (errorMessage, X, Y, defaultFont, blue)

	 elsif choice = buttonPhoneNumber then

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
	 var resultsX : int
	 var resultsY : int

	 GUI.SetBackgroundColour (BACKGROUND_COLOUR)

	 seek : nameID, location
	 get : nameID, currentName : *
	 
	 for line : 1 .. count
		  get : addressID, currentAddress : *
		  get : phoneNumberID, currentPhoneNumber : *
	 end for

	 resultsX := 75
	 resultsY := 300
	 Font.Draw (currentName, resultsX, resultsY, defaultFont, red)

	 resultsY := resultsY - 70
	 Font.Draw (currentAddress, resultsX, resultsY, defaultFont, red)

	 resultsY := resultsY - 70
	 Font.Draw (currentPhoneNumber, resultsX, resultsY, defaultFont, red)

	 resultsX := resultsX + 350
	 Pic.Draw (picture (count), resultsX, resultsY, picCopy)

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

		  displayError (0)

	 elsif choice = buttonClear then

		  GUI.SetText (searchBar, "")

	 elsif choice = buttonName then

		  search (choice, nameID)

	 elsif choice = buttonAddress then

		  search (choice, addressID)

	 else

		  search (choice, phoneNumberID)

	 end if

end handleClick


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


body procedure initializePicture

	 for contact : 1 .. NUMBER_OF_CONTACTS

		  picture (contact) := Pic.FileNew (intstr (contact) + ".jpeg")

	 end for

end initializePicture


body procedure openFiles

	 open : nameID, NAME_FILE, get, seek
	 open : addressID, ADDRESS_FILE, get, seek
	 open : phoneNumberID, PHONE_NUMBER_FILE, get, seek

end openFiles


body procedure processText (textFromField : string)

	 searchItem := textFromField

end processText


body procedure search (userChoice : int, fileID : int)

	 var currentItem : string

	 count := 0

	 seek : fileID, 0

	 loop

		  if eof (fileID) then

				displayError (userChoice)
				exit

		  end if

		  tell : fileID, location
		  get : fileID, currentItem : *

		  count := count + 1

		  if currentItem = searchItem then

				displayResults

				exit

		  end if

	 end loop

end search


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

initializePicture

openFiles

loop

	 exit when GUI.ProcessEvent

end loop

wrapUp
