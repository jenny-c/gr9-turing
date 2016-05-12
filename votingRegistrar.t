% declaration section

const VOTING_AGE := 18

var age : int
var eligibility : string
var eligible : boolean
var anotherCitizen : int


% Greet and instruct the user.

put "Welcome to the Voting Registrar."
put skip, "You will be asked about your age and then"
put "you will be told your eligibility to vote.", skip


% Get age.
loop

	 put "Age in whole years? " ..
	 get age


	 % Determine eligibility.
	 
	 eligible := age >= VOTING_AGE
	 
	 if eligible then
		  eligibility := ""
	 else
		  eligibility := "not "
	 end if


	 % Display eligibility.

	 put "You are ", eligibility, "eligible to vote.", skip

	 put "Is there another citizen? [any int for yes, 0 for no] " ..
	 get anotherCitizen

	 if anotherCitizen = 0 then
		  exit
	 end if

end loop


% Signal completion.

put "Thank you for using the Voting Registrar."
