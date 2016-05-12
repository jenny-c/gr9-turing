% declaration section

const EXIT_VALUE := "$"

var givenName : string
var numberOfStudents : int
var ALBucketCount : int
var MPBucketCount : int
var QZBucketCount : int


% initialization section

numberOfStudents := 0
ALBucketCount := 0
MPBucketCount := 0
QZBucketCount := 0


% get and process names

loop

	 put "Given name? [$ to exit] " ..
	 get givenName

	 exit when givenName = "$"

	 numberOfStudents := numberOfStudents + 1

	 if givenName <= "L" then
		  ALBucketCount := ALBucketCount + 1
	 elsif givenName >= "M" and givenName <= "P" then
		  MPBucketCount := MPBucketCount + 1
	 else
		  QZBucketCount := QZBucketCount + 1
	 end if

end loop


% output section

put skip, "Total number of student names: ", numberOfStudents
put "   Number of names from A - L: ", ALBucketCount
put "   Number of names from M - P: ", MPBucketCount
put "   Number of names from Q - Z: ", QZBucketCount

put skip, "Done!"
