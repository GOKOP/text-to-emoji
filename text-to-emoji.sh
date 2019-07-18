#!/bin/bash

# substitute $1 characters with appropiate dic.list entry
function subst() {
	snip=${orig::$1}
	match=$(cat dic.list | grep -F "$snip " | head -n 1 | awk '{print $2}')
	[ -z $match ] && return 1

	orig=${orig:$1}
	emoji="$emoji$match"
}

# copy character if it can't be replaced
function copy() {
	letter=${orig::1}
	if [[ $letter == " " ]]; then
		letter="   "               # enlarge spaces so they stand out
	else 
		letter=$(echo $letter | awk '{print toupper($0)}')
	fi
	emoji="$emoji$letter"
	orig=${orig:1}
}

orig=$(echo $1 | awk '{print tolower($0)}')
while [ ! -z "$orig" ]; do
	len=4
	succ=1
	while (( $len > 0 )) && [ $succ == 1 ]; do
		subst $len
		succ=$?
		len=$(echo "$len-1" | bc)
	done
	[ $succ == 1 ] && copy
done

echo "$emoji"
