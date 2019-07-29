require 'nokogiri'
require 'open-uri'

def scrappeur
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	return page
end

def symbol(donne)
	symbol_array = []
	ass = donne.xpath('//td[@class="text-left col-symbol"]')
	for i in 0..ass.length-1 do
		symbol_array << ass[i].text		
	end
	return symbol_array
end

def price(donne)
	price_array = []
	bss = donne.xpath('//a[@class = "price"]')
	for j in 0..bss.length-1 do
		price_array << bss[j].text	
	end
	return price_array
end

def dark_trader(ass, bss)
	result = []
	for k in 0..ass.length-1 do
		result << {ass[k] => bss[k].scan(/\d/).join('').to_f}
	end
	return result
end
puts dark_trader(symbol(scrappeur), price(scrappeur))
