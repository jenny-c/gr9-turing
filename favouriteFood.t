% declaration section

var favouriteFood : array 1 .. * of string := init
	 ("mango", "sushi", "bread", "potato", "mushroom")
var numberOfFoods : int
var indexNumber : int
var currentNumber : string


% initialization section

numberOfFoods := upper (favouriteFood)


% Greet and instruct the user

put "Welcome!", skip
put "You will be prompted for a number and"
put "you will receive the favourite food in that place.", skip


% Get index number.

loop

	 % Make sure number is valid.
	 loop

		  put "Number [0 to exit]? " ..
		  get currentNumber

		  if strintok (currentNumber) then

				indexNumber := strint (currentNumber)

				% Exit if the number is valid.
				exit when indexNumber >= 0 and indexNumber <= numberOfFoods

		  end if


		  % Display error message.
		  color (red)
		  put "*** Number must be between 0 and ", numberOfFoods, skip
		  color (black)

	 end loop

	 exit when indexNumber = 0

	 put favouriteFood (indexNumber), skip

end loop


% Thank the user.

put skip, "Thank you!"
