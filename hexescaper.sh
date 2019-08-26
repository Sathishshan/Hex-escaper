#!/bin/bash

green="\e[92m"
red="\e[91m"
blue="\e[34m"
none="\e[0m"

function usage {
echo -e "
Please use the hex value with ${red}"double quotes"!${none} :D

${blue}USAGE:${none}
      	$0 Option Hex
${blue}EXAMPLE:${none}
        $0 -e 735f796172612d72756c65736574
${blue}OPTIONS:${none}
	-e		Escape_hex
	-r		Reverse_hex_escape
	-we		White_escape
	-wre		White_reverse_escape"
}

if [ ${#} -ne 2 ]; then
       echo -e ${none}"Need two arguments to run the script."${none}
       usage
       exit
fi

case $1 in
	-e)
		echo -e ${green}"Hex value escaped!"${none}
		echo "$2" | fold -w 2 | tr "\n" " " | sed 's/\s/\\x/g' | sed 's/\\x$/ /' | sed 's/^/\\x/'
		echo
		shift
		;;
	-r)
		echo -e ${green}"Hex value reversed the escape!"${none}
		echo "$2" | sed 's/\\x//g'
		;;
	-we | -ew)
		echo -e ${green}"Hex value with whitespace is escaped!"${none}
		echo "$2" | sed 's/\s//g' | fold -w 2 | tr "\n" " " | sed 's/\s/\\x/g' | sed 's/\\x$/ /' | sed 's/\b/\\x/'
		echo
		;;
	-wre | -erw | -rwe |-ewr)
		echo -e ${green}"Hex value reversed with whitespace!"${none}
		echo "$2" | sed 's/\\x/ /g' | sed 's/^\s//'
		;;
	*)
		usage
		exit 2
		;;
esac
