### Hex-escaper

Hex-escaper is used to escape the Hex code and vise-versa and also Encode Decode text into Hex and vise-versa. In PCRE Regex we have broke the hex code into pair of pieces and escape them with \x (the primitive type escape sequence) to match the pattern. It is very useful & comes to handy once you debugging hex code for Regex (PCRE)

```
Need two arguments to run the script.

Please use the hex value in double quotes! :D

USAGE:
        ./escape_hex Option Hex
EXAMPLE:
        ./escape_hex -e "735f796172612d72756c65736574"
OPTIONS:
        -e              Escape_hex
        -r              Reverse_hex_escape
        -we             White_escape
        -wre            White_reverse_escape
        -E              Encode_hex - (Convert)
        -D              Reverse_hex - (Decode)
```
