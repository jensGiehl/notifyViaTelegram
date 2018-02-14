#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "Which text should be send? Provide message as parameter!"
	exit 1
fi


text=$1
chatId=${2:-$TELEGRAM_CHAT_ID}
botName=${3:-$TELEGRAM_BOTNAME}

curl --silent --output /dev/null \
  -X POST \
  https://api.telegram.org/bot$botName/sendMessage \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d "{ \"chat_id\": $chatId, \"text\": \"$text\" }"
