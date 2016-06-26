% declaration section

import GUI

const QUESTION_FILE_NAME := "questions.text"

var answer : array 1 .. 20 of string
var count : int
var question : int
var questionFile : int
var buttonAnswer : int
var buttonFinish : int
var buttonQuestion : int
var fileWasEstablished : boolean
var textField : int


forward procedure acceptAnswer
forward procedure establishFile
forward procedure poseQuestion
forward procedure processText (currentAnswer : string)
forward procedure setUp
forward procedure wrapUp


body procedure acceptAnswer

	 count := count + 1

	 answer (count) := GUI.GetText (textField)
	 
	 GUI.SetText (textField, "")

end acceptAnswer


body procedure establishFile

	 open : questionFile, QUESTION_FILE_NAME, get

	 fileWasEstablished := questionFile > 0

end establishFile


body procedure poseQuestion

	 var currentQuestion : string
	 
	 if eof (questionFile) then
	 
		 GUI.Quit 

	 elsif GUI.GetText (textField) = "" then

		  get : questionFile, currentQuestion : *

		  GUI.SetLabel (question, currentQuestion)

	 else

		  return

	 end if

end poseQuestion


body procedure processText (currentAnswer : string)

end processText


body procedure setUp

	 const SPACER := 50

	 var widgetText : string
	 var x : int
	 var y : int

	 count := 0
	 x := SPACER
	 y := maxy - SPACER

	 widgetText := "pose question"
	 buttonQuestion := GUI.CreateButton (x, y, 0, widgetText, poseQuestion)

	 y := y - SPACER
	 widgetText := "accept answer"
	 buttonAnswer := GUI.CreateButton (x, y, 0, widgetText, acceptAnswer)

	 y := y - SPACER
	 widgetText := "finish"
	 buttonFinish := GUI.CreateButton (x, y, 0, widgetText, GUI.Quit)

	 x := x + SPACER * 3
	 y := maxy - SPACER

	 widgetText := "click \"question\" to get the next question"
	 question := GUI.CreateLabel (x, y, widgetText)

	 y := y - SPACER
	 textField := GUI.CreateTextField (x, y, SPACER * 7, "", processText)

end setUp


body procedure wrapUp

	 close : questionFile
	 
	 GUI.Dispose (buttonQuestion)
	 GUI.Dispose (buttonAnswer)
	 GUI.Dispose (buttonFinish)
	 GUI.Dispose (question)
	 GUI.Dispose (textField)
	 
	 for answerIndex : 1 .. count
	 
		  put answer (answerIndex)
	 
	 end for

end wrapUp


% main program

establishFile

if fileWasEstablished = false then

	 return

end if

setUp

loop

	 exit when GUI.ProcessEvent

end loop

wrapUp
