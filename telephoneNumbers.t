% declarartion section

const TELEPHONE_NUMBER_FILE := "telephoneNumbers.text"
const TELEPHONE_NAME_FILE := "telephoneNumberNames.text"

var currentNumber : string
var telephoneNumberFileID : int
var telephoneNumberNameFileID : int
var numberOfLines : int
var lineOfText : string
var nameFound : boolean

forward procedure displayTelephoneNumber
forward procedure getNumber
forward procedure getValidNumber
forward procedure greetUser


body procedure displayTelephoneNumber

	 if nameFound = true then

		  for line : 1 .. numberOfLines

				get : telephoneNumberNameFileID, lineOfText : *

		  end for

		  put lineOfText

	 else

		  colour (red)
		  put "*** Person not found."
		  colour (black)

	 end if

	 close : telephoneNumberFileID
	 close : telephoneNumberNameFileID

end displayTelephoneNumber


body procedure getNumber

	 open : telephoneNumberFileID, TELEPHONE_NUMBER_FILE, get
	 open : telephoneNumberNameFileID, TELEPHONE_NAME_FILE, get

	 put skip, "Phone number [0 to exit]: " ..
	 get currentNumber


end getNumber


body procedure getValidNumber

	 numberOfLines := 0

	 loop

		  get : telephoneNumberFileID, lineOfText : *

		  numberOfLines := numberOfLines + 1

		  if lineOfText = currentNumber then

				nameFound := true

				put lineOfText, ": " ..

				exit

		  else

				nameFound := false

		  end if
		  
		  exit when eof (telephoneNumberFileID)

	 end loop

end getValidNumber


body procedure greetUser

	 put "Welcome to the Virtual Phonebook."
	 put "You will be prompted for a phone number."

end greetUser


% main program

greetUser

loop

	 getNumber

	 exit when currentNumber = "0"

	 getValidNumber
	 displayTelephoneNumber

end loop

put skip, "Thank you!"











