% declaration section

var choice : int
var fileName : string
var inputFile : int
var lineOfText : string
var limerick : array 1 .. * of string := init
	 ("limerick1.text", "limerick2.text", "limerick3.text", "limerick4.text",
	 "limerick5.text")
var limerickName : array 1 .. * of string := init
	 ("Dog and Goat", "Insulting", "Bright", "Jonathan's Gravy",
	 "The Young Lady's Chin")
var numberOfLimericks : int


forward procedure chooseLimerick
forward procedure displayLimerick
forward procedure greetUser
forward procedure readLimerick (IDNumber : int)
forward procedure thankUser


body procedure chooseLimerick

	 numberOfLimericks := upper (limerick)

	 put skip, "[0] to exit"

	 % display limerick titles
	 for title : 1 .. numberOfLimericks

		  put "[", title, "] ", limerickName (title)

	 end for

	 put skip, "Limerick? " ..
	 get choice

end chooseLimerick


body procedure displayLimerick

	 % make sure choice was valid
	 if choice > 0 and choice <= numberOfLimericks then

		  open : inputFile, limerick (choice), get

		  % the file was not found, show error message
		  if inputFile < 0 then

				put "File \"", fileName, "\" not found."
				put "Please re-enter a file name.", skip

				% limerick was found so read it
		  else

				readLimerick (inputFile)

		  end if

		  % user's choice was not valid. prompt for another choice
	 else

		  colour (red)
		  put "Invalid choice. Please enter a number between 0 - ",
				numberOfLimericks
		  colour (black)

	 end if

end displayLimerick


body procedure greetUser

	 put "Welcome to the Limerick Reader."
	 put "You will be prompted to choose from several limericks."

end greetUser


body procedure readLimerick (IDNumber : int)

	 get : IDNumber, lineOfText

	 % read entire file
	 loop

		  exit when eof (IDNumber)

		  get : IDNumber, lineOfText : *
		  put lineOfText

	 end loop

	 close : IDNumber

end readLimerick


body procedure thankUser

	 put "Thank you for using the Limerick Reader!"

end thankUser


% main program

greetUser

loop

	 % user chooses from the menu
	 chooseLimerick

	 % does the user want to exit?
	 exit when choice = 0

	 % the user did not want to exit
	 displayLimerick

end loop

thankUser
