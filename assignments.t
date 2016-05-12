% declaration section

var students : array 1 .. 3 of string
var assignmentMeans : array 1 .. 3 of real
var assignmentTotals : array 1 .. 3 of real
var assignment1 : array 1 .. 3 of real
var assignment2 : array 1 .. 3 of real
var assignment3 : array 1 .. 3 of real


% initialization section

for count : 1 .. 3

	 assignmentTotals (count) := 0

end for


% Gather student names.

for student : 1 .. 3

	 put "Student name? " ..
	 get students (student)

end for

put ""


% Gather marks for all assignments.

for mark : 1 .. 3

	 put students (mark), "'s mark for assignment 1? " ..
	 get assignment1 (mark)

	 assignmentTotals (1) := assignmentTotals (1) + assignment1 (mark)

end for

put ""

for mark : 1 .. 3

	 put students (mark), "'s mark for assignment 2? " ..
	 get assignment2 (mark)

	 assignmentTotals (2) := assignmentTotals (2) + assignment2 (mark)

end for

put ""

for mark : 1 .. 3

	 put students (mark), "'s mark for assignment 3? " ..
	 get assignment3 (mark)

	 assignmentTotals (3) := assignmentTotals (3) + assignment3 (mark)

end for

put skip


% Calculate means.

for count : 1 .. 3

	  assignmentMeans (count) := (assignmentTotals (count) / 3)

end for


% Display marks for each student.

for student : 1 .. 3

	 put "For ", students (student), ":"

	 put "assignment 1: ", assignment1 (student) : 4, " difference: ", (assignmentMeans (1) - assignment1 (student)) * -1 : 4 : 2
	 put "assignment 2: ", assignment2 (student) : 4, " difference: ", (assignmentMeans (2) - assignment2 (student)) * -1 : 4 : 2
	 put "assignment 3: ", assignment3 (student) : 4, " difference: ", (assignmentMeans (3) - assignment3 (student)) * -1 : 4 : 2, skip

end for
