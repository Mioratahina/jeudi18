require 'nokogiri'
require 'open-uri'


def pages
	page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
	return page
end

def get_townhall_email(town)
	email = town.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
	return email.text
end
puts get_townhall_email(pages)