% declaration section

setscreen ("graphics : 10000, 10000")

const DELAY_TIME := 2000
const NUMBER_OF_FOOD_ITEMS := 3
const X_VALUE := 0
const Y_VALUE := 0

var food : array 1 .. NUMBER_OF_FOOD_ITEMS of int
var foodName : array 1 .. * of string := init
	 ("potato", "tomato", "bacon")
var userChoice : string
var menuChoice : int
var validChoice : boolean


for foodItem : 1 .. NUMBER_OF_FOOD_ITEMS

	 food (foodItem) := Pic.FileNew (intstr (foodItem) + ".jpeg")

	 if food (foodItem) = 0 then

		  put Error.Last
		  put Error.LastMsg

	 end if

end for


forward procedure displayFoodPicture
forward procedure displayMenu
forward procedure getUserChoice


body procedure displayFoodPicture

	 Pic.Draw (food (menuChoice), X_VALUE, Y_VALUE, picCopy)
	 
	 delay (DELAY_TIME)

end displayFoodPicture


body procedure displayMenu

	 put "[0] to exit."

	 for foodNumber : 1 .. NUMBER_OF_FOOD_ITEMS

		  put "[", foodNumber, "] for ", foodName (foodNumber)

	 end for

end displayMenu


body procedure getUserChoice

	 validChoice := false

	 loop

		  put "Which food would you like? " ..
		  get userChoice

		  if strintok (userChoice) then

				menuChoice := strint (userChoice)

				exit when menuChoice = 0

				for foodNumber : 0 .. NUMBER_OF_FOOD_ITEMS

					 exit when menuChoice = foodNumber

					 validChoice := true

				end for

		  end if

		  put userChoice, " is not a valid choice. Please enter a menu choice."

		  return

	 end loop

end getUserChoice


% main program

loop

	 loop
	 
		  cls

		  displayMenu

		  getUserChoice

		  exit when menuChoice = 0 or validChoice = true

	 end loop

	 if validChoice = true then

		  displayFoodPicture

	 else

		  exit

	 end if

end loop

put "Thank you!"







