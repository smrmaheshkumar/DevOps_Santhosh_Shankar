#if-then statement in action
echo "Enter Source and target file names"
read source target
if mv $source $target
then
echo "Your file has been succesfully renamed"
fi
