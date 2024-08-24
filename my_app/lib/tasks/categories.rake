desc "Create categories"
task categories: :environment do
   Category.create([
                      {category_name: "Tables"},
                      {category_name: "Chairs"},
                      {category_name: "Beds"},
                      {category_name: "Desks"},
                      {category_name: "Dressers"},
                      {category_name: "Cupboards"}
                    ])
	puts 'Created categories'
end