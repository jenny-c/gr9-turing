% declaration section

const ADDRESS_FILE := "address.text"
const NAME_FILE := "telephoneNumberNames.text"
const NUMBER_FILE := "telephoneNumbers.text"
const NUMBER_OF_NAMES := 3

var address : string
var addressFileNumber : int
var arrayIndex : int
var contactAddress : array 1 .. NUMBER_OF_NAMES of string
var contactName : array 1 .. NUMBER_OF_NAMES of string
var contactNumber : array 1 .. NUMBER_OF_NAMES of string
var contactPicture : array 1 .. NUMBER_OF_NAMES of int
var name : string
var nameFileNumber : int
var number : string
var numberFileNumber : int
var userChoiceAddress : string
var userChoiceName : string
var userChoiceNumber : string
var userOption : int

forward procedure acceptDatabaseQueries
forward procedure getAddresses
forward procedure getNames
forward procedure getNumbers
forward procedure getPictures
forward procedure getUserPreference
forward procedure greetAndInstructUser
forward procedure searchByAddress
forward procedure searchByName
forward procedure searchByNumber
forward procedure thankUser

setscreen ("graphics")


body procedure acceptDatabaseQueries
	 loop
		  getUserPreference
		  exit when userOption = 0
		  cls
		  if userOption = 1 then
				searchByName
		  elsif userOption = 2 then
				searchByNumber
		  elsif userOption = 3 then
				searchByAddress
		  else
				colourback (brightred)
				put "***Please type a number from 0-3.***"
				cls
		  end if
	 end loop
end acceptDatabaseQueries

body procedure getAddresses
	 % open : addressFileNumber, ADDRESS_FILE, get
	 % arrayIndex := 0
	 % loop
	 %     exit when eof (addressFileNumber)
	 %     arrayIndex := arrayIndex + 1
	 %     get : addressFileNumber, contactAddress (arrayIndex) : *
	 % end loop
	 % close : addressFileNumber
end getAddresses


body procedure getNames
	 open : nameFileNumber, NAME_FILE, get
	 arrayIndex := 0
	 loop
		  exit when eof (nameFileNumber)
		  arrayIndex := arrayIndex + 1
		  get : nameFileNumber, contactName (arrayIndex) : *
	 end loop
	 close : nameFileNumber
end getNames


body procedure getNumbers
	 open : numberFileNumber, NUMBER_FILE, get
	 arrayIndex := 0
	 loop
		  exit when eof (numberFileNumber)
		  arrayIndex := arrayIndex + 1
		  get : numberFileNumber, contactNumber (arrayIndex) : *
	 end loop
	 close : numberFileNumber
end getNumbers


body procedure getPictures
	 for pictureNumber : 1 .. NUMBER_OF_NAMES
		  contactPicture (arrayIndex) := Pic.FileNew ("\"" +
				intstr (pictureNumber) + ".jpeg\"")
	 end for
end getPictures


body procedure getUserPreference
	 put skip, "[0] Exit database."
	 put "[1] Search by name."
	 put "[2] Search by number."
	 put "[3] Search by address."
	 put skip, "0-3? " ..
	 get userOption
end getUserPreference


body procedure greetAndInstructUser
	 put "Welcome to the Contacts Database."
	 put "Type 1 to search by name, 2 to search by number, "
	 put "and 3 to search by address. Type 0 to exit."
end greetAndInstructUser


body procedure searchByAddress
	 put "Address? " ..
	 get userChoiceAddress

	 arrayIndex := 1

	 cls
	 loop
		  if arrayIndex > NUMBER_OF_NAMES then
				colourback (brightred)
				put "***Contact not found***", skip
				colourback (white)
				exit
		  end if

		  if contactAddress (arrayIndex) = userChoiceAddress then
				put contactName (arrayIndex)
				put contactNumber (arrayIndex)
				put contactAddress (arrayIndex)
				Pic.Draw (contactPicture (arrayIndex), 0, 0, picCopy)
				exit
		  end if

		  arrayIndex := arrayIndex + 1
	 end loop
	 cls
end searchByAddress


body procedure searchByName
	 put "Name? " ..
	 get userChoiceName

	 arrayIndex := 1

	 cls
	 loop
		  if arrayIndex > NUMBER_OF_NAMES then
				colourback (brightred)
				put "***Contact not found***", skip
				colourback (white)
				exit
		  end if

		  if contactName (arrayIndex) = userChoiceName then
				put contactName (arrayIndex)
				put contactNumber (arrayIndex)
				put contactAddress (arrayIndex)
				Pic.Draw (contactPicture (arrayIndex), 0, 0, picCopy)
				exit
		  end if

		  arrayIndex := arrayIndex + 1
	 end loop
	 cls
end searchByName


body procedure searchByNumber
	 put "Number? " ..
	 get userChoiceNumber

	 arrayIndex := 1

	 cls
	 loop
		  if arrayIndex > NUMBER_OF_NAMES then
				colourback (brightred)
				put "***Contact not found***", skip
				colourback (white)
				exit
		  end if

		  if contactNumber (arrayIndex) = userChoiceNumber then
				put contactName (arrayIndex)
				put contactNumber (arrayIndex)
				put contactAddress (arrayIndex)
				Pic.Draw (contactPicture (arrayIndex), 0, 0, picCopy)
				exit
		  end if

		  arrayIndex := arrayIndex + 1
	 end loop
	 cls
end searchByNumber


body procedure thankUser
	 put skip, "Thanks for using the Contacts Database."
end thankUser


% main program

greetAndInstructUser
getAddresses
getNames
getNumbers
getPictures
acceptDatabaseQueries
thankUser
