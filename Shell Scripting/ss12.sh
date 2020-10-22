#Run checks on numbers
echo "Enter a number between 10 and 20:\c"
read num
if [ $num -ne 10 ]
then
	echo "That was under the belt partner."
elif  [  $num  -gt 20  ]
then
	echo "That went over my head"
else
	echo "Now you are making sense"
fi
