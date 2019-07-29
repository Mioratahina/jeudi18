require 'nokogiri'
require 'open-uri'

def france
	page = Nokogiri::HTML(open("http://www.assemblee-nationale.fr/qui/xml/regions.asp?legislature=14"))
	name_array = []
	email_array = []
	full_name = []
	f_name = []

	linktext = page.xpath('//a[@class="dep2"]')
	for i in 0..linktext.length-1
		name_array << linktext[i].text
	end
	linkname_array = []
	for j in 0..name_array.length-1
		linkname_array << linktext[j]['href']
		linkname_array[j][0] = "http://www.assemblee-nationale.fr/"
		page = Nokogiri::HTML(open("#{linkname_array[j]}"))
		email = page.xpath('//a[contains(@href, "mailto")]')
		email_array << email.text
	end
	result = []
	for k in 0..email_array.length-1 do
		result << {name_array[k] => email_array[k]}
	end
	return result
	#return linkname_array
end
puts france