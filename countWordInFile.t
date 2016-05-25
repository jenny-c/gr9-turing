% declaration sections

var currentWord : string
var fileName : string
var fileIDNumber : int
var wordToFind : string
var numberOfTimesWordAppears : int


forward procedure getFileNameAndWord


body procedure getFileNameAndWord

	 put "File? " ..
	 get fileName

	 put "Word to find? " ..
	 get wordToFind

end getFileNameAndWord


function countAppearancesOfWord (file : int, word : string) : int

		  numberOfTimesWordAppears := 0

	 loop

		  get : file, currentWord

		  if currentWord = word then

				numberOfTimesWordAppears := numberOfTimesWordAppears + 1

		  end if

		  exit when eof (fileIDNumber)

	 end loop

	 result numberOfTimesWordAppears

end countAppearancesOfWord


% main program

getFileNameAndWord

open : fileIDNumber, fileName, get

put countAppearancesOfWord (fileIDNumber, wordToFind)

close : fileIDNumber

