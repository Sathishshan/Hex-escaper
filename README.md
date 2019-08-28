### Hex-escaper

Hex-escaper is used to escape the Hex code and vise-versa and also Encode Decode text into Hex and vise-versa. In PCRE Regex we have broke the hex code into pair of pieces and escape them with \x (Legacy escape-sequence for hex) to match the pattern. It is very useful & comes to handy once you debugging hex code for Regex (PCRE)

```
Need two arguments to run the script.

Please use the hex value in double quotes! :D

USAGE:
        ./hexescaper Option Hex
EXAMPLE:
        ./hexescaper -e "735f796172612d72756c65736574"
OPTIONS:
        -e              Escape_hex
        -r              Reverse_hex_escape
        -d              Double_escape - (escape the escape)
        -dr             Reversed_double_escape
        -we             White_escape
        -wre            White_reverse_escape
        -w              Just_white space b/w hex
        -E              Encode_hex - (Convert)
        -D              Reverse_hex - (Decode)
```
```
shan@exploit:~$ ./hexescaper.sh -e "68657865736361706572"
Hex value escaped!
\x68\x65\x78\x65\x73\x63\x61\x70\x65\x72

shan@exploit:~$ ./hexescaper.sh -r "\x68\x65\x78\x65\x73\x63\x61\x70\x65\x72"
Hex value reversed the escape!
68657865736361706572
```
```
shan@exploit:~$ ./hexescaper -d "\x68\x65\x78\x65\x73\x63\x61\x70\x65\x72"
Hex value escape the escaped!
\\x68\\x65\\x78\\x65\\x73\\x63\\x61\\x70\\x65\\x72

shan@exploit:~$ ./hexescaper -dr "\\x68\\x65\\x78\\x65\\x73\\x63\\x61\\x70\\x65\\x72" 
Hex value reversed the double escape!
\x68\x65\x78\x65\x73\x63\x61\x70\x65\x72
```

```
shan@exploit:~$ ./hexescaper.sh -we "68 65 78 65 73 63 61 70 65 72"
Hex value with whitespace is escaped!
\x68\x65\x78\x65\x73\x63\x61\x70\x65\x72

shan@exploit:~$ ./hexescaper.sh -wre "\x68\x65\x78\x65\x73\x63\x61\x70\x65\x72"
Hex value reversed with whitespace!
68 65 78 65 73 63 61 70 65 72
```

```
shan@exploit:~$ ./hexescaper.sh -E "hexescaper"
Converted the text to hex!
68657865736361706572

shan@exploit:~$ ./hexescaper.sh -D "68657865736361706572"
Reversed the hex to text!
hexescaper
```
#### Caution:   
The hex values not have been validated it is hex or not, so if you give correct input it will give you the correct output!
