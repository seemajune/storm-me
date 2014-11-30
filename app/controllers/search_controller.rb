require 'open-uri'
require 'json'

class SearchController < ApplicationController

  def index
    base_url = 'https://api.instagram.com/v1/tags/'
    query_string = 'weather/media/recent?access_token='
    token = #token 

    json = open(base_url + 'weather' + query_string + token).read 
    json_data = JSON.parse(json)

    all_image_results = json_data["data"]

    all_image_thumbnails = []
      all_image_results.each do |result, value|
        all_image_thumbnails.push(result["images"]["thumbnail"]["url"])
      end
      @all_image_thumbnails = all_image_thumbnails
  end

end