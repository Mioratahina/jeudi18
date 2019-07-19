require 'nokogiri'
require 'open-uri'

puts "\n voici les listes des emails de Val-d-Oise \n"

def get_townhall_urls
	page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
	town_array = []
	email_array = []
	linktext = page.xpath('//a[@class="lientxt"]')
	for i in 0..linktext.length-1
		town_array << linktext[i].text
	end
	linktown_array = []
	for j in 0..town_array.length-1
		linktown_array << linktext[j]['href']
		linktown_array[j][0] = "https://www.annuaire-des-mairies.com"
		page = Nokogiri::HTML(open("#{linktown_array[j]}"))
		email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
		email_array << email.text
	end
	#return town_array
	#return email_array
	result = []
	for k in 0..email_array.length-1 do
		result << {town_array[k] => email_array[k]}
	end
	return result

end
puts get_townhall_urls