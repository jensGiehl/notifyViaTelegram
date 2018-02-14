# Send Notifications to Telegram
A simple bash script to send a (Telegram)[https://telegram.org/] message using curl.

## How to setup?
First you need a Bot-Id. To receive this id, just start a conversation with (BotFather)[https://t.me/botfather].

After that the Bot must know in which Chat he should post the notification.
In case you want to send a Notification directly to you, simple send a message to your Bot. After that call the
following URL: ```https://api.telegram.org/bot{BOT-ID}/getUpdates``` (replace ```{BOT-ID}``` with your Bot-Id.
In the response you will find the chat id.


You can now execute the script like this:
```
./sendMessage.sh "My Message" "Bot-Id" "Chat-Id"
```

OR you can put the Bot and Chat-ID into a enviorment variables named:
```TELEGRAM_CHAT_ID``` and ```TELEGRAM_BOTNAME```
