#Case Statement
echo "Enter a word:\c"
read word
case $word in
[aeiou]* | [AEIOU]*)
	echo "The word begins with a vowel"
	;;
[0-9]*)
	echo "The word begins with a digit"
	;;
*[0-9])
	echo "The word ends with digit"
	;;
???)
	echo "You entered a three letter word"
	;;
*)
	echo "I dont know what you have entered"
	;;
esac
