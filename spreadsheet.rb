
require 'bundler'
Bundler.require

 
# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("mairie41-config.json")
 

# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("mairiedu41")

# Get the first worksheet
worksheet = spreadsheet.worksheets.first


# Print out the first 6 columns of each row
worksheet.rows.each { |row| puts row.first(6).join(" | ") }


worksheet.insert_rows(2, [["Hello!", "This", "was", "inserted", "via", "Ruby"]])
worksheet.save