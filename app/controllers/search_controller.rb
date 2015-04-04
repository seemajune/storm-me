
require 'open-uri'

class SearchController < ApplicationController

  def index
    base_url = 'https://api.instagram.com/v1/tags/'
    query_string = 'weather/media/recent?access_token='
    token = '50668157.5b9e1e6.0347384d4d26410089b8236038578950'

    json = open(base_url + query_string + token).read 
    json_data = JSON.parse(json)

    all_image_results = json_data["data"]

    all_image_thumbnails = []
    locations = [];
    all_image_results.each do |result, value|
      #all_image_thumbnails.push(result["images"]["thumbnail"]["url"])
      if result["location"]
        locations.push(result["images"]["thumbnail"]["url"], result["location"])
      end
      locations
    end
    @all_image_thumbnails = all_image_thumbnails
    @locations = locations
  end

  def show
    base_url = 'https://api.instagram.com/v1/tags/'
    query_string = 'weather/media/recent?access_token='
    token = '50668157.5b9e1e6.0347384d4d26410089b8236038578950'

    json = open(base_url + query_string + token).read 
    json_data = JSON.parse(json)

    all_image_results = json_data["data"]

    all_image_thumbnails = []

    all_image_results.each do |result, value|
      all_image_thumbnails.push(result["images"]["thumbnail"]["url"])
    end
    @all_image_thumbnails = all_image_thumbnails
  end

end