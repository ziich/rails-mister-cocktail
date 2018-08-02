# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
# https://github.com/flori/json
require 'json'
# http://stackoverflow.com/questions/9008847/what-is-difference-between-p-and-pp
require 'pp'

# Construct the URL we'll be calling
request_uri = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
request_query = ''
url = "#{request_uri}#{request_query}"

# Actually fetch the contents of the remote URL as a String.
buffer = open(url).read
result = JSON.parse(buffer)["drinks"]
# An example of how to take a random sample of elements from an array. Pass the number of elements you want into .sample() method. It's probably a better idea for the server to limit the results before sending, but you can use basic Ruby skills to trim & modify the data however you'd like.

result.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end


# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
