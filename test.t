% declaration section

var numberOfStrings : int
var randomStrings : array 1 .. * of string := init
	 ("Hello", "Joe", "Dave", "Bob", "Steve", "Python", "Ruby", "Swift")
var stringNumber : int


% initialization section

numberOfStrings := upper (randomStrings)


% Greet and instruct the user.

put skip, "Welcome to the String Selector", skip
put "You will be prompted for an integer, press 0 to exit.", skip


% Gather user's number and output the selected string.

loop

	 % Get valid string number.
	 loop
				
		  color(black)
		  put "Number? " ..
		  get stringNumber

		  % Was it valid input?
		  exit when stringNumber >= 0 and stringNumber <= numberOfStrings

		  % It was not, so display error message.
		  color (red)
		  put "*** Number must be between 0 and ", numberOfStrings, skip

	 end loop

	 % Does the user want to exit?
	 exit when stringNumber = 0

	 color(brightblue)
	 put randomStrings (stringNumber), skip

end loop

color(black)
put "Thank you for using the String Selector."


