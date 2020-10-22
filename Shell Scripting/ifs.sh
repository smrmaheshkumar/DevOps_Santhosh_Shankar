#Internal field seperator

line="Shell:scripting:is:fun."
IFS=:
set $line
echo $1
echo $2
echo $3
echo $4
