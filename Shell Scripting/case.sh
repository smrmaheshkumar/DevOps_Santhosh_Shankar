#Case statement

echo "Enter a character:\c"
read var
case $var in
[a-z])
	echo "You entered a lowercase alphabet"
	;;
[A-Z])
	echo "You entered an upper case alphabet"
	;;
[0-9])
	echo "You entered a digit"
	;;
?)
	echo "You enterd a special symbol"
	;;
*)
	echo "You have entered more than one characters"
	;;
esac

