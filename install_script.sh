
echo "this is a script to install all the packages"

echo "reading file........."

file='requirement_file1.txt'
while read line; do
	pip install $line
done < $file

# collecting all the installed packages
pip freeze>installed_file.txt

# function to check if all packages are installed
function Is_installed() {
	flag1=0
	for list in $(cat installed_file.txt); do
		if [ $list = $1 ]
			then   
    			flag1=1
    			break
		fi
	done
if [[ $flag1 -eq 1 ]]
	then
		val=1
    	echo $val
	else
    	val=0
    	echo $val
fi
}

echo "--------------------------------------------"

#checking if all the packages are installed
flag=0
file='requirement_file1.txt'
while read line; do
	result=$(Is_installed $line)
	if [[ $result == 1 ]]; then   #reading each line
    	continue
	else
    	flag=1
	fi
done < $file


if [[ flag == 0 ]]; then
	echo "Yay...Installation Success"
else
	file='requirement_file1.txt'
	while read line; do
	# reading each line
	result=$(Is_installed $line)
	if [[ $result == 0 ]]; then
   		echo $line "--Oops.. installation failed"
	fi
	done < $file
fi