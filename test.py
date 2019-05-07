from urllib.request import urlopen as uReq
from bs4 import BeautifulSoup as soup
site='https://coinmarketcap.com/currencies/litecoin'

#open page
uClient = uReq(site)
#dumps HTML
page_HTML = uClient.read()
#Closes webpage
uClient.close
page_soup = soup(page_HTML, "html.parser")
#grabs coinmarket coin information
container = page_soup.findAll(id="quote_price")
containers = container[0]
price = containers.span.getText()
print(price)
profit_per_coin= float(price) - 155
Prof_Per = str(profit_per_coin)
if float(price) > 155:
	print("You are making "+Prof_Per+" dollars profit per coin")
else:
	print("You are losing "+Prof_Per+" dollars profit per coin")




