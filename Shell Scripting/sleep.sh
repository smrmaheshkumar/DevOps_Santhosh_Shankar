#Sleep while you are at work
echo "Enter a sentence:\c"
read str
for word in $str
do 
	echo $word
	sleep 5
done
