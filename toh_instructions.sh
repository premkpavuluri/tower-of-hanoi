clear

#Instructions
dashes=$( seq -f'=' -s'=' 20 )
echo -e "\t\t${dashes}>>> Tower of Hanoi Game Instructions <<<${dashes}\n"
echo -e "-The goal is to move all the Disks from 1st pole to 3rd pole in the same order.\n-You can only move one disk at a time."
echo -e "-large value disk can't be placed at small value disk.\n"

#starting positions
echo "-------->Intial positions<-------"
echo
echo -e "pole1 : 1 2 3"
echo "pole2 :"
echo -e "pole3 :\n"

#final positions
echo "-------->Final positions<-------"
echo
echo -e "pole1 :"
echo "pole2 :"
echo -e "pole3 : 1 2 3\n"


#hit any key to start
read -p "Press any key to Start the game >>>"


