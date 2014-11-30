class Weather < ActiveRecord::Base
end

# //////// my CLI notes to integrate into controller, forms in views and class instances

# require 'open-uri'
# require 'json'

# puts "enter a search term"
# search_term = gets.strip

# base_url = 'https://api.instagram.com/v1/tags/'

# query_string = '/media/recent?access_token=50668157.5b9e1e6.0347384d4d26410089b8236038578950'

# json = open(base_url + search_term + query_string).read 
# json_data = JSON.parse(json)

# all_image_results = json_data["data"]

#   all_image_links = []
#   all_image_results.each do |result, value|

#    all_image_links = result["images"]["thumbnail"]["url"]
#   end
  
#   all_image_links

# puts all_image_links