# GUIDE

# it should be like this for color '\033[38;2;<r>;<g>;<b>2m<text>\033[m'

# END OF GUIDE

quotes=(
    # fucking bake fucking no fucking hana's fucking lyrics
    "\033[38;2;255;112;1162mIt's as if a flower of transformation has bloomed.\033[m"
    "\033[38;2;200;183;2552mWell, it's a displeasure to meet you~\033[m"
    "\033[38;2;255;112;1162mWhat's with those eyes? Ah, of course it's those eyes-!\033[m"
    "\033[38;2;221;108;1082mThis flower of transformation will soon disappear here.\033[m"
    "\033[38;2;255;112;1162mI can't say anything, but I can't erase it.\033[m"
    "\033[38;2;255;112;1162mIt's as if I am made to end the curse of being born.\033[m"

    # my own thoughts and quotes, pretty huh?
    "You know, back in my days..."
    ":kannasip:"
    "How's your day lately?"
    "\"Milo ais satu ye bang~\""
    "Today's Homework~!"
)

tput bold
tput blink
echo -e "---- ${quotes[$((RANDOM % ${#quotes[@]}))]} ----"
