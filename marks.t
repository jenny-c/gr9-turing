% declaration section

const A_THRESHOLD := 90
const B_THRESHOLD := 80
const C_THRESHOLD := 70
const D_THRESHOLD := 60
const FIELD_WIDTH := 4
const DECIMALS := 1

var means : array 1 .. 5 of real
var tallies : array 1 .. 5 of int
var totals : array 1 .. 5 of real
var grades : array 1 .. 5 of char
var commonGrades : array 1 .. 5 of char
var mark : real
var mostCommon : string
var highestMode : int
var commonIndex : int


% initialization section

for count : 1 .. 5
	tallies (count) := 0 
end for

for count : 1 .. 5
	totals (count) := 0 
end for

for count : 1 .. 5
	means (count) := 0 
end for

grades (1) := 'A'
grades (2) := 'B'
grades (3) := 'C'
grades (4) := 'D'
grades (5) := 'F'
highestMode := 0
commonIndex := 1


% Greet and instruct user.

put "Welcome to the Mark Calculator!"
put "Please enter yours marks.", skip

% Get and process marks.

loop

	 % Get mark.

	 put "Mark: [negative to exit] " ..
	 get mark


	 % No more students?

	 exit when mark < 0


	 % Increment tallies for the different grades.

	 if mark >= A_THRESHOLD then

		  tallies (1) := tallies (1) + 1
		  totals (1) := totals (1) + mark

	 elsif mark >= B_THRESHOLD then

		  tallies (2) := tallies (2) + 1
		  totals (2) := totals (2) + mark

	 elsif mark >= C_THRESHOLD then

		  tallies (3) := tallies (3) + 1
		  totals (3) := totals (3) + mark

	 elsif mark >= D_THRESHOLD then

		  tallies (4) := tallies (4) + 1
		  totals (4) := totals (4) + mark

	 else

		  tallies (5) := tallies (5) + 1
		  totals (5) := totals (5) + mark

	 end if

end loop

put commonGrades (commonIndex)

% processing section (take care of dividing by 0 error)

if tallies (1) > 0 then
	 means (1) := totals (1) / tallies (1)
end if

if tallies (2) > 0 then
	 means (2) := totals (2) / tallies (2)
end if

if tallies (3) > 0 then
	 means (3) := totals (3) / tallies (3)
end if

if tallies (4) > 0 then
	 means (4) := totals (4) / tallies (4)
end if

if tallies (5) > 0 then
	 means (5) := totals (5) / tallies (5)
end if


% Display tally results.

put skip, "Students' marks:"

for count : 1 .. 5

	 put "Students with ", grades (count), ": ", tallies (count) : FIELD_WIDTH
	 put "           Mean: ", means (count) : FIELD_WIDTH : DECIMALS

end for


% Find the highest mode.

for count : 1 .. 5

	 if highestMode not= 0 then

		  if tallies (count) >= highestMode then

				highestMode := tallies (count)
				commonGrades (commonIndex) := grades (count)

				commonIndex := commonIndex + 1

		  end if

	 else

		  if tallies (count) > highestMode then

				highestMode := tallies (count)
				commonGrades (commonIndex) := grades (count)

				commonIndex := commonIndex + 1

		  end if

	 end if

end for


% Display which grades have the highest mode.

put skip, "The most common grade(s) is/are: " ..

for count : 1 .. commonIndex

	 put commonGrades (count), " " ..

end for


% Signal completion.

put skip, skip, "We're done!"
