% declaration section

var userName : string

forward procedure getUserName
forward procedure greetUser


body procedure getUserName
	 put "What is your name? " ..
	 get userName
end getUserName


body procedure greetUser
	 put "Hello ", userName, "!"
end greetUser


% main program

getUserName
greetUser
