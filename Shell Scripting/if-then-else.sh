#if-then-else
echo "Enter Source and target file names"
read source target
if mv $source $target
then
echo "Your file has been succesfully renamed"
else
echo "The file could not be renamed"
fi

