require 'nokogiri'
require 'open-uri'
require 'bundler'
Bundler.require


page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/loir-et-cher.html"))
links = page.css("a.lientxt")
liste = links.each{|departement|
    "http://annuaire-des-mairies.com" + departement['href'].slice!(1..33)
    a = departement.text

email = Nokogiri::HTML(open(a))
email.css('p:contains("@")').each do |node|
    b = node.text

# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("mairie41-config.json")

# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("mairiedu41")

# Get the first worksheet
worksheet = spreadsheet.worksheets.first

# écris sur la ligne du dessous et sauv
worksheet.insert_rows(worksheet.num_rows + 1, [[a, b]])
worksheet.save

end
}
