% declaration section

var currentNumber : string
var number1 : real
var number2 : real
var numberCount : int
var sum : real

forward procedure calculateSum
forward procedure displaySum
forward procedure getNumbers


body procedure calculateSum

	 sum := number1 + number2

end calculateSum


body procedure displaySum

	 put skip, number1, " + ", number2, " = ", sum

end displaySum


body procedure getNumbers

	 numberCount := 1

	 loop

		  put "Number ", numberCount, ": " ..
		  get currentNumber

		  if strrealok (currentNumber) then
				if numberCount = 1 then
					 number1 := strreal (currentNumber)
					 numberCount := 2
				else
					 number2 := strreal (currentNumber)
					 exit
				end if
		  else
				color (red)
				put "Error. You didn't enter valid numbers.", skip
				color (black)
				numberCount := 1
		  end if

	 end loop

end getNumbers


% main program

getNumbers
calculateSum
displaySum
