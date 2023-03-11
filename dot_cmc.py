from requests import Request, Session
from requests.exceptions import ConnectionError, Timeout, TooManyRedirects
import json

with open(".coinmarketapikey", "r") as f:
  key = str(f.readline()).strip()

url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest'
parameters = {
  'id':'1',
  'convert':'USD'
}
headers = {
  'Accepts': 'application/json',
  'X-CMC_PRO_API_KEY': key,
}

session = Session()
session.headers.update(headers)

try:
  response = session.get(url, params=parameters)
  data = json.loads(response.text)
  price = int(data["data"]["1"]["quote"]["USD"]["price"])
  with open("btcprice.txt", "w") as f:
    f.write(str(price))
except (ConnectionError, Timeout, TooManyRedirects) as e:
  print(e)
