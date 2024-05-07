# Fill the DB with some instances we can use
puts "Cleaning the DB..."
Restaurant.destroy_all

CHEFS = %w[Alex Andrew Hayato Junhyeok Justin Kimberly Matthew Moritz Rei Riya Sean Stan Vincent Yoana]
CATEGORIES = %W[burger ramen sushi desserts healthy kebabs pizza tacos sandwiches dumplings soup curry rice pasta steakhouse vegan bakery juice salads seafood brunch wings cafe bbq deli pies buffet pub brasserie shakes creamery grill]

def get_category(name)
  last_word = name.split.last.downcase
  CATEGORIES.include?(last_word) ? last_word : CATEGORIES.sample
end


puts "Creating #{CHEFS.count} Restaurants..."
CHEFS.shuffle.each do |name|
  restaurant_name = Faker::Restaurant.unique.name
  Restaurant.create!(
    name: "#{name}'s #{restaurant_name}",
    rating: rand(3..5),
    address: Faker::Address.street_address,
    category: get_category(restaurant_name)
  )
end
puts "... created #{Restaurant.count} restaurants"
