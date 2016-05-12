% Declaration Section

const ADDITION_CHOICE := 1
const DIVISION_CHOICE := 4
const LEAVE_CHOICE := 2
const MULTIPLICATION_CHOICE := 3
const STAY_CHOICE := 1
const SUBTRACTION_CHOICE := 2

var choice : int
var done : boolean
var firstNumber : real
var leave : int
var secondNumber : real


% Input Section

loop

	 loop

		  put "Type 1 for addition, 2 for subtraction, ",
				"3 for multiplication and 4 for division: " ..
		  get choice

		  exit when choice = ADDITION_CHOICE or choice = SUBTRACTION_CHOICE or 
		  choice = MULTIPLICATION_CHOICE or choice = DIVISION_CHOICE

	 end loop

	 put " Type in your first number: " ..
	 get firstNumber

	 put "Type in your second number: " ..
	 get secondNumber


	 % Processing and Ouput Section

	 if choice = 1 then

		  put skip, "The answer to ", firstNumber, " + ", secondNumber,
				" is: ", firstNumber + secondNumber

	 elsif choice = 2 then

		  put skip, "The answer to ", firstNumber, " - ", secondNumber,
				" is: ", firstNumber - secondNumber

	 elsif choice = 3 then

		  put skip, "The answer to ", firstNumber, " * ", secondNumber,
				" is: ", firstNumber * secondNumber

	 else

		  put skip, "The answer to ", firstNumber, " / ", secondNumber,
				" is: ", firstNumber / secondNumber

	 end if

	 loop

		  put skip, "Do you want to do another equation? ",
				"Type 1 for yes, 2 for no: " ..
		  get leave
		  put skip

		  exit when leave = STAY_CHOICE or leave = LEAVE_CHOICE

	 end loop

	 exit when leave = LEAVE_CHOICE

end loop


