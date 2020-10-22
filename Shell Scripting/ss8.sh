#Math on Integers using 'expr'
#Arithmetic operations

a=25 b=5

echo `expr $a + $b`
echo `expr $a - $b`
echo `expr $a \* $b`
echo `expr $a / $b`
echo `expr $a % $b`

a=30 b=15 c=2 d=5
echo `expr $a \* \( $b + $c \) / $d`
