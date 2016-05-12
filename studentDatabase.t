% declaration section

const exitChoice := "0"
const searchNameChoice := "1"
const searchNumberChoice := "2"

var currentNumber : string
var currentStudentName : string
var currentStudentNumber : string
var nameFound : boolean
var numberFound : boolean
var numberOfStudents : int
var studentNumber : array 1 .. * of string := init 
	 ("324-235-754", "923-256-267", "623-863-153", "546-234-653", "345-234-674")
var studentName : array 1 .. * of string := init 
	 ("Dave", "Steve", "Kevin", "Bob", "Joe")
var userChoice : string


% initialization section

numberOfStudents := upper (studentName)


% Greet and instruct the user.

put "Welcome to the Student Database.", skip
put "To learn a student's name, enter her/his name."
put "To lean a student's name, enter her/his name."
put "To exit the database, enter 0 (zero).", skip, skip


% Get and process data.
loop

	 nameFound := false
	 numberFound := false

	 % Get a valid choice from user.
	 loop

		  put "[", exitChoice, "] Exit database."
		  put "[", searchNameChoice, "] Search by name."
		  put "[", searchNumberChoice, "] Search by number."

		  put skip, exitChoice, " - ", searchNumberChoice, "? " ..
		  get userChoice

		  if userChoice = exitChoice or userChoice = searchNameChoice or userChoice = searchNumberChoice then
				exit
		  else
				put "*** Valid choices are ", exitChoice, " - ", searchNumberChoice, ".", skip

		  end if

	 end loop

	 % Does the user want to exit?
	 exit when userChoice = exitChoice

	 % Does user want to search by name?
	 if userChoice = searchNameChoice then
		  put "Name: " ..
		  get currentStudentName

		  % Check if student name is valid.
		  for student : 1 .. numberOfStudents

				if studentName (student) = currentStudentName then

					 nameFound := true
					 put studentNumber (student), skip

				end if
		  end for
		  
		  % Name was not found.
		  if nameFound = false then
				put "*** Name not found.", skip
		  end if

		  % If not, user must want to search by number.
	 else
		  put "Number: " ..
		  get currentStudentNumber

		  % Check if student number is valid.
		  for student : 1 .. numberOfStudents

				if studentNumber (student) = currentStudentNumber then

					 numberFound := true
					 put studentName (student), skip

				end if
		  end for

		  % Number was not found.
		  if numberFound = false then
				put "*** Name not found.", skip
		  end if

	 end if

end loop


% Thank user.

put skip, "Thank you for using the Student Database."






