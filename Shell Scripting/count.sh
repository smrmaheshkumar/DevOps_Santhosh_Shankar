#Count the number of charcters in users input in your script
#Tutorial-35

echo "Enter a character:\c"
read var
if [ `echo $var | wc -c' -eq 2 ]
then
	echo "You entered a character"
else
	echo "Invalid input"
fi


#Not executed
