% declaration section

const EXPRESSION_FILE_NAME := "integerExpressions.text"

var answer : int
var counter : int
var expressionFile : int
var expression : array 1 .. 20 of string


forward procedure getExpression
forward procedure calculateAndDisplayExpression
forward procedure wrapUp


body procedure getExpression

	 var currentItem : string
	 var lastItemIsInt : boolean

	 lastItemIsInt := false
	 counter := 0
	 answer := 0

	 open : expressionFile, EXPRESSION_FILE_NAME, get

	 loop

		  exit when eof (expressionFile)

		  get : expressionFile, currentItem
		  
		  if strintok (currentItem) and lastItemIsInt = true then

				lastItemIsInt := false
				calculateAndDisplayExpression

		  else
		  
				counter := counter + 1

				lastItemIsInt := false
		  
				if strintok (currentItem) then

					 lastItemIsInt := true

				end if

				expression (counter) := currentItem
				
				put expression (counter)
				delay(1000)

		  end if

	 end loop

end getExpression


body procedure calculateAndDisplayExpression

	 for count : 1 .. counter

		  put expression (count), " " ..

	 end for

	 put " = " ..

	 loop

		  exit when counter <= 1

		  for count : 1 .. counter

				case expression (count) of

					 label "+" :

						  answer := answer + strint (expression (count - 1)) + strint(expression (count + 1))

					 label "-" :

						  answer := answer + strint (expression (count - 1)) - strint(expression (count + 1))

					 label "div" :

						  answer := answer + strint(expression (count - 1)) div strint(expression (count + 1))

					 label "*" :

						  answer := answer + strint(expression (count - 1)) * strint(expression (count + 1))

					 label "mod" :

						  answer := answer + strint(expression (count - 1)) mod strint(expression (count + 1))

					 label :

						  answer := answer

				end case
				
				counter := counter - 2
				
				for number : count .. counter
				
					 expression (count) := expression (count - 2)
				
				end for
				
				exit

		  end for
		  
		  put answer, skip

	 end loop

end calculateAndDisplayExpression


body procedure wrapUp


end wrapUp


% main program

getExpression
wrapUp

