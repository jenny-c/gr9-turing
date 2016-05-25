var contactAddress : array 1 .. 3 of string
var arrayIndex : int
var addressFileNumber : int

forward procedure getAddresses 

body procedure getAddresses
			open : addressFileNumber, "address.text", get
			arrayIndex := 0
			loop
						exit when eof (addressFileNumber)
						arrayIndex := arrayIndex + 1
						get : addressFileNumber, contactAddress (arrayIndex) : *
						put arrayIndex
			end loop
			close : addressFileNumber
end getAddresses

getAddresses
