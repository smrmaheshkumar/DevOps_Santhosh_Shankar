#Count the number of word ans sentences in a text files
#Using wc

echo "Enter a filename:\c"
read fname

terminal=`tty`

exec < $fname

nol=0
now=0

while read line 
do
	nol=`expr $nol + 1`
	set $line
	now=`expr $now + $#`
done

echo "Number of lines:$nol"
echo "Number of words:$now"

exec < $terminal
