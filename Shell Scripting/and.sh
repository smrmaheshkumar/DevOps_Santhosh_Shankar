#and.sh
echo "Enter a number between 50 and 100:\c"
read num 
if [ $num -le 100 -a $num -ge 50 ]
then
	echo "you are within limits"
else
	echo "you are out of limits"
fi	
