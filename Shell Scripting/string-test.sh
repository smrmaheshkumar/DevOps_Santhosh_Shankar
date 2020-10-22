#String Checks

str1="Hey World"
str2="Whats up"
str3=""

[ "$str1" = "$str2" ]
echo $?

[ "$str1" != "$str2" ]
echo $?

[ -n "$str3" ]
echo $?

[ -z "$str3" ]
echo $?
