require 'nokogiri'
require 'csv'
require 'open-uri'

if __FILE__ == $0
  link = 'https://www.newsweek.com/rankings/worlds-best-hospitals-2023'
  doc = Nokogiri::HTML(URI.open(link, 'User-Agent' => 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0'))
  csv_file_path = File.join(__dir__, 'data.csv')
  CSV.open(csv_file_path, 'w') do |csv|
    csv << ['Rank', 'Publication name', 'Country', 'City', 'State (US only)']
    doc.css('tbody tr').each do |row|
      rank = row.at_css('.col1').text.strip
      hospital_name = row.at_css('.col2').text.strip
      country = row.at_css('.col3').text.strip
      city = row.at_css('.col4').text.strip
      state = row.at_css('.col5').text.strip
      csv << [rank, hospital_name, country, city, state]
    end
  end
end
