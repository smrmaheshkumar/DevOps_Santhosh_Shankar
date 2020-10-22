#!/bin/bash
#This file takes a file name as an arguement and renames it.

mv $1 $2
cat $2


#Execution
#ss4.sh test out
#file will rename from test to out. test=$1 and out=$2
