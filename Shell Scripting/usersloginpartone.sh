#Know when users log in part one

echo "Enter username:\c"
read logname

time=0

while true
do
	who | grep "$logname" > /dev/null
	if [ $? -eq 0 ]
	then
		echo "$logname has logged in"
		if [ $time -ne 0 ]
		then
			echo "$logname was $time minute late in logging in"
		fi
		exit
	else
		time=`expr $time + 1`
		sleep 60
	fi
done
