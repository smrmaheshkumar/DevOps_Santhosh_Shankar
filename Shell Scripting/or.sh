#or logic operator

echo "Enter a lowercase character:\c"
read var
<<<<<<< HEAD
if [ `echo $var | wc -c` -eq 2 ]
then
        if [ $var = a -o $var = e -o $var = i -o $var = o -o $var = u ]
=======
if [ `echo $var | wc -c' -eq 2 ]
then
        if [ $var = a -o $var = e -o $var = i -o $var = 0 - o $var = u ]
>>>>>>> d8e9f9b117e54428a3f291e7c14581c8be2654de
        then
                echo "You entered a vowel"
        else
                echo "You didnt enter a vowel"
        fi
else
        echo "Invalid Input"
fi
<<<<<<< HEAD
=======


>>>>>>> d8e9f9b117e54428a3f291e7c14581c8be2654de
