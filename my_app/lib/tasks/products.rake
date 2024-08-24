desc "Create products"
task products: :environment do
    require "nokogiri"
    require "open-uri"
    url = "https://www.enchantedlearning.com/wordlist/furniture.shtml#wls-id-a"
    html = OpenURI.open_uri(url)
    doc = Nokogiri::HTML(html)
    div_element = doc.css("div.wordlist-item")
    div_element.each do |item|
      prname = item.text.strip
      Product.create(
        category_id: Category.order("RANDOM()").first.id,
        product_name: prname, 
        description: "Material: #{['Wood','Metal','Plastic'].sample}; Color: #{['Blue','Red','Green'].sample}", 
        price: rand(500..10000), 
        rating: rand(1.0..5.0).round(1), 
        quantity: rand(1..1000))
    end
	puts 'Created products'
end