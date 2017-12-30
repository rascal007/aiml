from flask import Flask, request
from pymessenger import Bot
from utis import fetch_reply
import requests,json

app = Flask(__name__)


FB_ACCESS_TOKEN = "EAADvwy1JmvcBAAxETszenZAZBVZB5AZC43S8XweyZBKIfiCGkbY4TOZBaA0qrVbTcdpmK7fREzfyI85W9E1JxrZCHI1oyaceWzq5ZAXEdaibSZCbIBgABSzF0JtKdu0pO6pen3JvUfhWHoJXgzhjU0R04ao66APetEsNQjsyNVYlZB4KEkj3ZCLOCG9"
bot = Bot(FB_ACCESS_TOKEN)


@app.route('/', methods=['GET'])
def verify():
	if request.args.get("hub.mode") == "subscribe" and request.args.get("hub.challenge"):
		if not request.args.get("hub.verify_token") == "hello":
			return "Verification token mismatch", 403
		return request.args["hub.challenge"], 200
	return "Hello world", 200


@app.route('/', methods=['POST'])
def webhook():
	print(request.data)

	data = request.get_json()

	if data['object'] == "page":
		entries = data['entry']

		for entry in entries:
			messaging = entry['messaging']

			for messaging_event in messaging:

				sender_id = messaging_event['sender']['id']
				recipient_id = messaging_event['recipient']['id']

				if messaging_event.get('message'):

					if messaging_event['message'].get('text'):

						query = messaging_event['message']['text']
						reply = fetch_reply(query, sender_id)

						bot.send_text_message(sender_id, reply['data'])

	return "ok", 200




if __name__ == "__main__":
	app.run(port=8000, use_reloader = True)