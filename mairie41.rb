
require 'nokogiri'
require 'open-uri'
require 'google_drive'
require 'rubygems'


page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/loir-et-cher.html"))
links = page.css("a.lientxt")
liste = links.each{|departement|
    
    
    a = "http://annuaire-des-mairies.com" + departement['href'].slice!(1..33)
    puts a
    
    
email = Nokogiri::HTML(open(a))
email.css('p:contains("@")').each do |node|
puts node.text
end
}
