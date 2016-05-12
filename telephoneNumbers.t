% declarartion section

var telephoneNumbers : array 1 .. * of string := init ("416-900-2328", "647-885-4242", "416-123-3434", "647-872-6475", "416-576-2345")
var names : array 1 .. * of string := init ("Home Phone", "Joanna Chen", "Robert Chen", "Bob Joe", "Dave Dave")
var numberOfTelephoneNumbers : int
var indexValue : int
var currentNumber : string

forward procedure getPhoneNumber
forward procedure getValidNumber
forward procedure greetUser


body procedure getPhoneNumber

	 % initialization
	 numberOfTelephoneNumbers := upper (telephoneNumbers)

	 % get phone number and output
	 loop

		  getValidNumber

		  if telephoneNumbers (indexValue) = "0" then

				put "Thank you!"

		  elsif telephoneNumbers (indexValue) not= currentNumber and telephoneNumbers (indexValue) not= "0" then
				color (red)
				put "*** Person not found"
				color (black)
		  end if

	 end loop

end getPhoneNumber


body procedure getValidNumber

	 put skip, "Phone number [0 to exit]: " ..
	 get currentNumber

	 for number : 1 .. numberOfTelephoneNumbers

		  % compare the data
		  if telephoneNumbers (number) = currentNumber or telephoneNumbers (number) = "0" then
				indexValue := number

				exit when telephoneNumbers (number) = "0"

				put telephoneNumbers (number), ": ", names (number)

		  end if

	 end for

end getValidNumber


body procedure greetUser

	 put "Welcome to the Virtual Phonebook."
	 put "You will be prompted for a phone number."
	 
end greetUser


% main program

greetUser
getPhoneNumber











