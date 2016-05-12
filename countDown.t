% declaration section

var counter : int


% initialization section

counter := 10


% output section

loop

	 if counter <= 0 then
	 
		  put counter, "!", skip, "We did it! We counted down to 0!"
		  
	 else

		  put counter, "..."
		  delay (3000)

	 end if

	 exit when counter <= 0

	 counter := counter - 1

end loop
