#|/bin/bash

brightness=$(brightnessctl get)
brightness_max=$(brightnessctl max)

percentage=$(echo "scale=2;$brightness/$brightness_max*100" | bc)

echo "{\"text\": \" ${percentage}%\",\"alt\": \" ${brightness}/${brightness_max}\",\"tooltip\": \"${brightness}/${brightness_max}\",\"class\": \"custom-brightness\"}"
