const NUMBER_OF_LINES := 5

var fileName : string
var inputFile : int
var lineOfText : string


loop

	 put "Input file? " ..
	 get fileName

	 open : inputFile, fileName, get

	 if inputFile < 0 then

		  put "File \"", fileName, "\" not found."
		  put "Please re-enter a file name.", skip

	 else

		  put "File was found!", skip, skip
		  exit

	 end if

end loop


for lineNumber : 1 .. NUMBER_OF_LINES

	 get : inputFile, lineOfText : *
	 put lineOfText

end for

close : inputFile

put skip, "Done!"
