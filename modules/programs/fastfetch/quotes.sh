# GUIDE
# it should be like this for color '\033[38;2;<r>;<g>;<b>2m<text>\033[m'

quotes=(
  # fucking bake fucking no fucking hana's fucking lyrics
  "It's as if a flower of transformation has bloomed."
  "Well, it's a displeasure to meet you~"
  "What's with those eyes? Ah, of course it's those eyes-!"
  "This flower of transformation will soon disappear here."
  "I can't say anything, but I can't erase it."
  "It's as if I am made to end the curse of being born."

  # my own thoughts and quotes, pretty huh?

  "You know, back in my days..."
  "Anima Immortalis Est."
  ":kannasip:"
  "How's your day lately?"
  "Milo ais satu ye bang~"
  "Today's Homework~!"
  "Bitter Choco Decoration~"
  "Anti Cyclone by Inabakumori"
)

printf "\"${quotes[$((RANDOM % ${#quotes[@]}))]}\", ${USER}@${HOSTNAME} said."
