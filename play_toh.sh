#! /bin/bash
source "toh_library.sh"

#pole values
COLS=("1 2 3" "" "")

function play_round () {
	echo -n "Enter source and destination pole numbers: " ; read -a poles

	local source_pole="${poles[0]}"
	local destination_pole="${poles[1]}"
	local source_disks=( ${COLS[ ${source_pole}-1 ]} )
	local destination_disks=( ${COLS[ ${destination_pole}-1 ]} )

	validate_inputs "${poles[@]}|${source_disks[@]},${destination_disks[@]}"
	if [[ $? == 1 ]]; then
		echo -e "\nInvalid move, Please try again...\n"
		play_round
	fi

	local updated_disks=$( move_disk "${source_disks[@]},${destination_disks[@]}" )
	COLS[${source_pole}-1]=$( echo $updated_disks | cut -d"," -f1 )
	COLS[${destination_pole}-1]=$( echo $updated_disks | cut -d"," -f2 )

	echo -e "\npole1 : ${COLS[0]}"
	echo "pole2 : ${COLS[1]}"
	echo -e "pole3 : ${COLS[2]}\n"

	is_levelcompleted "${COLS[2]}"
	if [[ $? == 0 ]]; then
		echo "Congratulations🥳🥳 You've completed the level"
		return 0
	fi
	play_round
}

bash toh_instructions.sh

clear
play_round
