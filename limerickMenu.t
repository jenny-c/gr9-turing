% declaration section

const NUMBER_OF_LINES := 5

var choice : int
var fileName : string
var inputFile : int
var lineOfText : string
var limerick : array 1 .. * of string := init
	 ("limerick1.text", "limerick2.text", "limerick3.text", "limerick4.text", "limerick5.text")
var limerickName : array 1 .. * of string := init
	 ("Dog and Goat", "Insulting", "Bright", "Jonathan's Gravy", "The Young Lady's Chin")
var numberOfLimericks : int


forward procedure chooseLimerick
forward procedure greetUser
forward procedure readLimerick (IDNumber : int)
forward procedure thankUser


body procedure chooseLimerick

	 loop

		  numberOfLimericks := upper (limerick)

		  put skip, "[0] to exit"

		  for title : 1 .. numberOfLimericks

				put "[", title, "] ", limerickName (title)

		  end for

		  put skip, "Limerick? " ..
		  get choice

		  exit when choice = 0

		  if choice > 0 and choice < numberOfLimericks then

				open : inputFile, limerick (choice), get

				if inputFile < 0 then

					 put "File \"", fileName, "\" not found."
					 put "Please re-enter a file name.", skip

				else

					 readLimerick (inputFile)

				end if
				
			else 
				
				colour (red)
				put "Invalid choice. Please enter a number between 0 - ", numberOfLimericks
				colour (black)

		  end if

	 end loop

end chooseLimerick


body procedure greetUser

	 put "Welcome to the Limerick Reader."
	 put "You will be prompted to choose from several limericks."

end greetUser


body procedure readLimerick (IDNumber : int)

	 for lineNumber : 1 .. NUMBER_OF_LINES

		  get : IDNumber, lineOfText : *
		  put lineOfText

	 end for

	 close : IDNumber

end readLimerick


body procedure thankUser

	 put "Thank you for using the Limerick Reader!"

end thankUser


% main program

greetUser
chooseLimerick
thankUser
