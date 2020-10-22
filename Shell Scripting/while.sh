#While loop in action
count=5
while [ $count -le 15 ]
do
	echo $count
	count=`expr $count + 1`
done
