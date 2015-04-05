
require 'open-uri'

class SearchController < ApplicationController

  def index
    base_url = 'https://api.instagram.com/v1/tags/'
    query_string = 'russiancircles/media/recent?access_token='
    token = '50668157.5b9e1e6.0347384d4d26410089b8236038578950'

    json = open(base_url + query_string + token).read 
    json_data = JSON.parse(json)
    all_image_results = json_data["data"]
    all_images = Hash.new
    all_image_results.each do |result, value|
      if result["location"]
        all_images[result["images"]["thumbnail"]["url"]] = result["location"]
      end
      all_images
    end
    @all_images = all_images
  end

  def show
  end

end