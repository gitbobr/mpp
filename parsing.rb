require 'nokogiri'
require 'open-uri'
require 'csv'

def parse_link(link)
  hash_map = {}
  doc = Nokogiri::HTML(URI.open(link))
  doc.css('.wordlist-section').each do |block|
    heading = block.css('.wordlist-section__title').text
    words = block.css('.wordlist-item').map(&:text)
    hash_map[heading] = words
  end
  hash_map
end

def generate_csv(hash_map)
  csv_file_path = File.join(__dir__, 'data.csv')
  CSV.open(csv_file_path, 'w') do |csv|
    csv << ['Category','Products']
    hash_map.each { |key, value| csv << [key, value.join(', ')] }
  end
end

if __FILE__ == $0
  hash_map = parse_link('https://www.enchantedlearning.com/wordlist/furniture.shtml#wls-id-a')
  generate_csv(hash_map)
end
