% declaration section

const JAN_DAYS := 31
const MAR_DAYS := 31
const APR_DAYS := 30
const MAY_DAYS := 31
const JUN_DAYS := 30
const JUL_DAYS := 31
const AUG_DAYS := 31
const SEP_DAYS := 30
const OCT_DAYS := 31
const NOV_DAYS := 30
const DEC_DAYS := 31

var birthdayMonth : int
var birthdayDay : int
var birthdayYear : int
var currentMonth : int
var currentDay : int
var currentYear : int
var isALeapYear : boolean
var daysOld : int
var daysInMonth : int
var daysInFeb : int
var year : int


% input section

put "Birthday? [mm dd yyyy] " ..
get birthdayMonth, birthdayDay, birthdayYear

put "Today's date? [mm dd yyyy] " ..
get currentMonth, currentDay, currentYear


% calculate days in first year

if birthdayYear mod 4 = 0 then
	 daysInFeb := 29
else
	 daysInFeb := 28
end if

case birthdayMonth of
	 label 1 :
		  daysOld := JAN_DAYS - birthdayDay + daysInFeb + MAR_DAYS + APR_DAYS + MAY_DAYS + JUN_DAYS + JUL_DAYS + AUG_DAYS + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 2 : 
		  daysOld := daysInFeb - birthdayDay + MAR_DAYS + APR_DAYS + MAY_DAYS + JUN_DAYS + JUL_DAYS + AUG_DAYS + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 3 :
		  daysOld := MAR_DAYS - birthdayDay + APR_DAYS + MAY_DAYS + JUN_DAYS + JUL_DAYS + AUG_DAYS + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 4 :
		  daysOld := APR_DAYS - birthdayDay + MAY_DAYS + JUN_DAYS + JUL_DAYS + AUG_DAYS + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 5 : 
		  daysOld := MAY_DAYS - birthdayDay + JUN_DAYS + JUL_DAYS + AUG_DAYS + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 6 :
		  daysOld := JUN_DAYS - birthdayDay + JUL_DAYS + AUG_DAYS + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 7 :
		  daysOld := JUL_DAYS - birthdayDay + AUG_DAYS + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 8 :
		  daysOld := AUG_DAYS - birthdayDay + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 9 : 
		  daysOld := SEP_DAYS - birthdayDay + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 10 :
		  daysOld := OCT_DAYS - birthdayDay + NOV_DAYS + DEC_DAYS
	 label 11 :
		  daysOld := NOV_DAYS - birthdayDay + DEC_DAYS
	 label : 
		  daysOld := DEC_DAYS - birthdayDay
end case 


% calculate years in between

year := birthdayYear

loop

	 year := year + 1
	 
	 exit when year >= currentYear
	 
	 if year mod 4 = 0 then
		  daysOld := daysOld + 366
	 else
		  daysOld := daysOld + 365
	 end if

end loop


% calculate days in current year

if currentYear mod 4 = 0 then
	 daysInFeb := 29
else
	 daysInFeb := 28
end if

case currentMonth of
	 label 12 :
		  daysOld := daysOld + DEC_DAYS - birthdayDay + daysInFeb + MAR_DAYS + APR_DAYS + MAY_DAYS + JUN_DAYS + JUL_DAYS + AUG_DAYS + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 11 : 
		  daysOld := daysOld + NOV_DAYS - birthdayDay + MAR_DAYS + APR_DAYS + MAY_DAYS + JUN_DAYS + JUL_DAYS + AUG_DAYS + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 10 :
		  daysOld := daysOld + OCT_DAYS - birthdayDay + APR_DAYS + MAY_DAYS + JUN_DAYS + JUL_DAYS + AUG_DAYS + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 9 :
		  daysOld := daysOld + SEP_DAYS - birthdayDay + MAY_DAYS + JUN_DAYS + JUL_DAYS + AUG_DAYS + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 8 : 
		  daysOld := daysOld + AUG_DAYS - birthdayDay + JUN_DAYS + JUL_DAYS + AUG_DAYS + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 7 :
		  daysOld := daysOld + JUL_DAYS - birthdayDay + JUL_DAYS + AUG_DAYS + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 6 :
		  daysOld := daysOld + JUN_DAYS - birthdayDay + AUG_DAYS + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 5 :
		  daysOld := daysOld + MAY_DAYS - birthdayDay + SEP_DAYS + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 4 : 
		  daysOld := daysOld + APR_DAYS - birthdayDay + OCT_DAYS + NOV_DAYS + DEC_DAYS
	 label 3 :
		  daysOld := daysOld + MAR_DAYS - birthdayDay + NOV_DAYS + DEC_DAYS
	 label 2 :
		  daysOld := daysOld + daysInFeb - birthdayDay + DEC_DAYS
	 label : 
		  daysOld := daysOld + JAN_DAYS - birthdayDay
end case


put "You are ", daysOld, " days old!"
