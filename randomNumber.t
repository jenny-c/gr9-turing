% declaration section

var randomNumber : int
var userNumber : int


% input section

randint (randomNumber, 0, 11)

put "Guess a number between 1 and 10 (inclusive): " ..
get userNumber


% processing and output section

loop

	 if userNumber < randomNumber then
	 
		  put "The number is higher, guess again: " ..
		  get userNumber
		  
	 elsif userNumber > randomNumber then
	 
		  put "The number is lower, guess again: " ..
		  get userNumber
		  
	 else 
	 
		  put "Yay! You guessed the number correctly!"
		  
		  exit when userNumber = randomNumber
		  
	 end if
	 
end loop
