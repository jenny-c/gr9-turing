% declaration section

const ARRAY_LIMIT := 20
const DELAY := 1000
const HST_TAX_RATE := 0.13

var numberOfItems : int
var itemPrices : array 1 .. ARRAY_LIMIT of real
var itemPricesIndex : int
var shoppingCart : array 1 .. ARRAY_LIMIT of string
var shoppingCartIndex : int
var totalPrice : real


% initialization section

itemPricesIndex := 1
shoppingCartIndex := 1
totalPrice := 0


% input section

put "How many items do you want to enter? " ..
get numberOfItems

loop

	 put "What is the item name? " ..
	 get shoppingCart (shoppingCartIndex)

	 put "What is the price of the item? " ..
	 get itemPrices (itemPricesIndex)
	 
	 put ""

	 shoppingCartIndex := shoppingCartIndex + 1
	 itemPricesIndex := itemPricesIndex + 1

	 exit when shoppingCartIndex > numberOfItems

end loop


% processing section

itemPricesIndex := 1

loop

	 totalPrice := totalPrice + itemPrices (itemPricesIndex)

	 itemPricesIndex := itemPricesIndex + 1

	 exit when itemPricesIndex > numberOfItems

end loop


% output section

colourback (black)
put ""

colourback(white)

put skip, "RECEIPT:", skip, skip, "These are your items:"
delay (DELAY)

shoppingCartIndex := 1

loop

	 put shoppingCartIndex, ") ", shoppingCart (shoppingCartIndex)
	 delay (DELAY)
	 
	 shoppingCartIndex := shoppingCartIndex + 1
	 
	 exit when shoppingCartIndex > numberOfItems

end loop

put skip
put "Total without tax: ", totalPrice
put "   Total with tax: ", totalPrice + totalPrice* HST_TAX_RATE : 0 : 2















