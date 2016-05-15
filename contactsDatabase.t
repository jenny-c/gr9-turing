% declaration section

const ADDRESS_FILE := "address.text"
const TELEPHONE_NUMBER_FILE := "telephoneNumbers.text"
const TELEPHONE_NAME_FILE := "telephoneNumberNames.text"
const SEARCH_BY_ADDRESS := "3"
const SEARCH_BY_NAME := "1"
const SEARCH_BY_NUMBER := "2"

var currentPerson : string
var choice : string
var telephoneNumberFileID : int
var telephoneNumberNameFileID : int
var addressFileID : int
var numberOfLines : int
var lineOfText : string
var personFound : boolean

forward procedure displayContactInformation
forward procedure getAddress
forward procedure getChoice
forward procedure getName
forward procedure getNumber
forward procedure greetUser


body procedure displayContactInformation

	 if personFound = true then

		  for line : 1 .. numberOfLines

				get : telephoneNumberNameFileID, lineOfText : *

		  end for

		  put "Name: ", lineOfText

		  for line : 1 .. numberOfLines

				get : telephoneNumberFileID, lineOfText : *

		  end for

		  put "Number: ", lineOfText

		  for line : 1 .. numberOfLines

				get : addressFileID, lineOfText : *

		  end for

		  put "Address: ", lineOfText

	 else

		  colour (red)
		  put "*** Person not found."
		  colour (black)

	 end if

end displayContactInformation


body procedure getAddress

	 put skip, "Name [0 to exit]: " ..
	 get currentPerson : *

	 if currentPerson = "0" then

		  return

	 end if

	 numberOfLines := 0

	 loop

		  get : addressFileID, lineOfText : *

		  numberOfLines := numberOfLines + 1

		  if lineOfText = currentPerson then

				personFound := true

				exit

		  else

				personFound := false

		  end if

		  exit when eof (addressFileID)

	 end loop

end getAddress


body procedure getChoice

	 loop

		  put skip, "[0] to exit"
		  put "[", SEARCH_BY_NAME, "] to search by name"
		  put "[", SEARCH_BY_NUMBER, "] to search by number"
		  put "[", SEARCH_BY_ADDRESS, "] to search by address"

		  put skip, "Choice? " ..
		  get choice

		  exit when choice = "0" or choice = SEARCH_BY_NAME or choice = SEARCH_BY_NUMBER or choice = SEARCH_BY_ADDRESS

		  put "Choice must be between 0 - ", SEARCH_BY_ADDRESS

	 end loop

end getChoice


body procedure getName

	 put skip, "Name [0 to exit]: " ..
	 get currentPerson : *

	 if currentPerson = "0" then

		  return

	 end if

	 numberOfLines := 0

	 loop

		  get : telephoneNumberNameFileID, lineOfText : *

		  numberOfLines := numberOfLines + 1

		  if lineOfText = currentPerson then

				personFound := true

				exit

		  else

				personFound := false

		  end if

		  exit when eof (telephoneNumberNameFileID)

	 end loop

end getName


body procedure getNumber

	 put skip, "Name [0 to exit]: " ..
	 get currentPerson : *

	 if currentPerson = "0" then

		  return

	 end if

	 numberOfLines := 0

	 loop

		  get : telephoneNumberFileID, lineOfText : *

		  numberOfLines := numberOfLines + 1

		  if lineOfText = currentPerson then

				personFound := true

				exit

		  else

				personFound := false

		  end if

		  exit when eof (telephoneNumberFileID)

	 end loop

end getNumber


body procedure greetUser

	 put "Welcome to the Virtual Phonebook."
	 put "Please choose what you would like to search by."

end greetUser


% main program

greetUser

loop

	 getChoice

	 exit when choice = "0"

	 open : telephoneNumberFileID, TELEPHONE_NUMBER_FILE, get
	 open : telephoneNumberNameFileID, TELEPHONE_NAME_FILE, get
	 open : addressFileID, ADDRESS_FILE, get

	 if choice = SEARCH_BY_NAME then

		  getName

		  close : telephoneNumberNameFileID
		  open : telephoneNumberNameFileID, TELEPHONE_NAME_FILE, get

	 elsif choice = SEARCH_BY_NUMBER then

		  getNumber

		  close : telephoneNumberFileID
		  open : telephoneNumberFileID, TELEPHONE_NUMBER_FILE, get

	 else

		  getAddress

		  close : addressFileID
		  open : addressFileID, ADDRESS_FILE, get

	 end if

	 displayContactInformation

	 close : telephoneNumberFileID
	 close : telephoneNumberNameFileID
	 close : addressFileID

end loop

put skip, "Thank you!"











