% declaration section

var counter : int
var highestNumber : real
var numbers : array 1 .. 5 of real
var orderedNumbers : array 1 .. 5 of real


% initialization section

counter := 1


% Gather numbers.

for number : 1 .. 5

	 put "Number? " ..
	 get numbers (number)

end for

put skip

% Sort the numbers.

for cycle : 1 .. 5

	 highestNumber := 0

	 for count : 1 .. 5

		  if numbers (count) > highestNumber then

				highestNumber := numbers (count)
				
				counter := count

		  end if 

	 end for
	 
	 numbers (counter) := 0

	 orderedNumbers (cycle) := highestNumber

end for


% Output sorted numbers. 

put "Decreasing order: "
 
for number : 1 .. 5

	 put orderedNumbers (number) : 4

end for


