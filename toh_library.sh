function validate_inputs () {
	local cols_and_disks="$@"
	local cols=( $( echo $cols_and_disks | cut -d"|" -f1 ) )
	local source_disks=( $( echo $cols_and_disks | cut -d"|" -f2 | cut -d"," -f1 ) )
	local destination_disks=( $( echo $cols_and_disks | cut -d"|" -f2 | cut -d"," -f2 ) )

	#basic validation
	if [[ ${cols[0]} == ${cols[1]} ]]; then
		return 1
	elif [[ "${cols[0]}" != [1-3] ]] || [[ "${cols[1]}" != [1-3] ]]; then
		return 1
	elif [[ ${#cols[@]} != 2 ]]; then
		return 1
	elif [[ ${#source_disks[@]} == 0 ]]; then
		return 1
	elif [[ ${source_disks[0]} > ${destination_disks[0]} ]] && [[ ${destination_disks[0]} == [1-3] ]]; then
		return 1
	fi
	return 0
}
function move_disk() {
	local disks=("$@")
	local source_pole=( $( echo ${disks[@]} | cut -d, -f1 ) )
	local destination_pole=( $( echo ${disks[@]} | cut -d, -f2 ) )

	destination_pole=( ${source_pole[0]} ${destination_pole[@]} )
	unset source_pole[0]

	echo "${source_pole[@]},${destination_pole[@]}"
}

function is_levelcompleted() {
	local last_pole=("$@")

	if [[ "${last_pole[@]}" == "1 2 3" ]]; then
		return 0
	fi
	return 1
}
