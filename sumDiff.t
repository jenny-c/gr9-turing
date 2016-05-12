% programmer: Jenny Chen
% 
%       date: 2016-03-29
% 
%  file name: sumDiff.t
% 
%    purpose: To find the sum and difference of two numbers.
% 
%      input: Two real numbers.
% 
% processing: Calculating the sum and difference.
% 
%     output: The sum and difference of two numbers.


% declaration section

var difference : real
var firstNumber : real
var secondNumber : real
var sum : real


% input section

put "what is the first number? " ..
get firstNumber

put "What is the second number? " ..
get secondNumber


% processing section

sum := firstNumber + secondNumber
difference := firstNumber - secondNumber


% output section

put "The sum of the numbers is ", sum, " and the difference is ", difference, "."
