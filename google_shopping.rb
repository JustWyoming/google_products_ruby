#RUBY!! no more semi-colons... ever.

#Wyoming's Ruby Google Shopping Homework

require 'json'
file = File.read("./products.json")

#Welcome to RUBY we use snake case now
#snake case word_word not camel case wordWord
google_data = JSON.parse(file)
items = google_data["items"]


#outputs the full object
# puts google_data.inspect

#outputs the first item's title
# puts google_data["items"][0]["product"]["title"]

#1. outputs all items containing shopping#product and counts them
count = 0

puts "Items that have 'shopping#product' as their 'kind': "
items.each {|i|
	if i["kind"] == "shopping#product"
		puts i["product"]["title"]
		count += 1
	end
}
puts '-'* 10
puts "There are #{count} items."
puts '-' * 10

#2. outputs items in invetories with 'backorder' as their availability
puts "Backordered items: "

items.each {|i|
	if i["product"]["inventories"][0]["availability"] == "backorder"
		puts i["product"]["title"]
	end
}
puts '-' * 10

#3. outputs all items with more than one image
puts "Items with multiple images:\n"

items.each {|i|
	if i["product"]["images"].length >=2
		puts i["product"]["title"]
	end
}
puts '-' * 10

# 4. Outputs all `canon` products.
puts "Here are all our canon products: \n"

items.each {|i|
	if i["product"]["brand"].downcase == "canon"
		puts i["product"]["title"]
	end
}
puts '-' * 10

# 5. output all `items` with **product** **author** **name** "eBay" and are brand "Canon".
puts "Canon products available on eBay: \n"

items.each {|i|
	if i["product"]["brand"].downcase == "canon" and i["product"]["author"]["name"].downcase.include? "eBay"
		puts i["product"]["title"]
	end
}
puts '-' * 10

# 6. output all products with their brand. price, image 
puts "Items by brand, price and image: \n"

items.each {|i|
	puts "Brand: #{i["product"]["brand"]}\n"
	puts "Price: $#{i["product"]["inventories"][0]["price"]}\n"
	puts "Images: #{i["product"]["images"][0]["link"]}\n\n"
}
puts '-' * 10
