% declaration section

const MAXIMUM_NUMBER_OF_LETTERS := 50
const MAXIMUM_NUMBER_OF_ERRORS := 3
const REPEATED_GUESS := "!"

var errorCount : int
var guessCount : int
var letter : array 1 .. MAXIMUM_NUMBER_OF_LETTERS of string
var numberOfLetters : int
var player1points : int
var player2points : int
var playerGuess : int


% initialization section

player1points := 0
player2points := 0


% Get number of letter

put "How many letters will you provide? " ..
get numberOfLetters
cls


% Get each letter.

for letterCount : 1 .. numberOfLetters

	 put "letter #", letterCount, "? " ..
	 get letter (letterCount)

end for
cls


% Get player's guesses

guessCount := 0
errorCount := 0

loop

	 % Get player 2 guess.
	 put "letter number [1 - ", numberOfLetters, "]? " ..
	 get playerGuess
	 cls

	 % Check if guess is an error.
	 if letter (playerGuess) = REPEATED_GUESS then

		  errorCount := errorCount + 1
		  player1points := player1points + 1

	 % Increment points and take guess out of consideration.
	 elsif letter (playerGuess) < 'a' then

		  player2points := player2points + 1

		  letter (playerGuess) := REPEATED_GUESS

	 % Increment points and take guess out of consideration.
	 else

		  player1points := player1points + 1

		  letter (playerGuess) := REPEATED_GUESS

	 end if

	 guessCount := guessCount + 1

	 exit when guessCount >= numberOfLetters or errorCount >= MAXIMUM_NUMBER_OF_ERRORS

end loop


% Display points for each player.

put "Player 1: ", player1points
put "player 2: ", player2points


