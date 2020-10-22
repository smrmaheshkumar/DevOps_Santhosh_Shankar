#Run checks on files
echo "Enter a name:\c"
read fname
if [ -f $fname ]
then
	echo "You indeed entered a file name"
else
	echo "Dont provide me crazy inputs"
fi

# -f -c etc are there
