#!/bin/bash

green="\e[92m"
red="\e[91m"
blue="\e[34m"
none="\e[0m"

function usage {
echo -e "Please use the hex value in ${red}"double quotes"!${none} :D

${blue}USAGE:${none}
        $0 Option Hex
${blue}EXAMPLE:${none}
        $0 -e \"735f796172612d72756c65736574\"
${blue}OPTIONS:${none}
        -e              Escape_hex
        -r              Reverse_hex_escape
        -d              Double_escape - (escape the escape)
        -dr             Reversed_double_escape
        -we             White_escape
        -wre            White_reverse_escape
        -w              Just_white space b/w hex
        -E              Encode_hex - (Convert)
        -D              Reverse_hex - (Decode)"
}

if [ ${#} -ne 2 ]; then
        echo -e ${none}"Need two arguments to run the script."${none}
  echo
        usage
        exit
fi

case "$1" in
    -e)
        echo -e ${green}"Hex value escaped!"${none}
        echo -n "$2" | fold -w 2 | tr "\n" " " | sed 's/\s/\\x/g' | sed 's/\\x$/ /' | sed 's/^/\\x/'
        echo
        ;;
    -r)
        echo -e ${green}"Hex value reversed the escape!"${none}
        echo -n "$2" | sed 's/\\x//g'
        echo
        ;;
    -d)
        echo -e ${green}"Hex value escape the escaped!"${none}
        echo -n "$2" | sed 's/\x/\\\x/g'
        echo
        ;;
    -dr|-rd)
        echo -e ${green}"Hex value reversed the double escape!"${none}
        echo -n "$2"
        echo
        ;;
    -we | -ew)
        echo -e ${green}"Hex value with whitespace is escaped!"${none}
        echo -n "$2" | sed 's/\s//g' | fold -w 2 | tr "\n" " " | sed 's/\s/\\x/g' | sed 's/\\x$/ /' | sed 's/\b/\\x/'
        echo
        ;;
    -wre | -erw | -rwe | -ewr | -wer | -rew)
        echo -e ${green}"Hex value reversed with whitespace!"${none}
        echo -n "$2" | sed 's/\\x/ /g' | sed 's/^\s//'
        echo
        ;;
    -w)
        echo -e ${green}"Hex value White Spaced!"${none}
        echo -n "$2" | fold -w 2 | tr "\n" " "
        echo
        ;;
    -E)
        echo -e ${green}"Converted the text to hex!"${none}
        echo -n "$2" | xxd -ps
        ;;
    -D)
        echo -e ${green}"Reversed the hex to text!"${none}
        echo -n "$2" | xxd -ps -r
        echo
        ;;
    *)
        usage
        exit 2
        ;;
esac
