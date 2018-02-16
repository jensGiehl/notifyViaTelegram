#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "Which text should be send? Provide message as parameter!"
	exit 1
fi

# Copyied just in case ;)
urlencode() {
	echo "$*" | sed 's:%:%25:g;s: :%20:g;s:<:%3C:g;s:>:%3E:g;s:#:%23:g;s:{:%7B:g;s:}:%7D:g;s:|:%7C:g;s:\\:%5C:g;s:\^:%5E:g;s:~:%7E:g;s:\[:%5B:g;s:\]:%5D:g;s:`:%60:g;s:;:%3B:g;s:/:%2F:g;s:?:%3F:g;s^:^%3A^g;s:@:%40:g;s:=:%3D:g;s:&:%26:g;s:\$:%24:g;s:\!:%21:g;s:\*:%2A:g'
}

text="$(echo "$1" | sed 's/"//g')"
chatId=${2:-$TELEGRAM_CHAT_ID}
botName=${3:-$TELEGRAM_BOTNAME}

#curl -s --output /dev/null "https://api.telegram.org/bot$botName/sendMessage" -F "chat_id=$chatId" -F "text=${text}"
# -F "parse_mode=html"

file="/home/pi/screenshots/2018-02-16_1700.png"
curl -s  "https://api.telegram.org/bot$botName/sendPhoto" -F "chat_id=$chatId" -F "photo=@$file" -F "caption=Hallo Welt"

: '
curl --silent --output /dev/null \
  -X POST \
  https://api.telegram.org/bot$botName/sendMessage \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d "{ \"chat_id\": $chatId, \"text\": \"$text\" }"
'
