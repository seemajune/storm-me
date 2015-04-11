
require 'open-uri'

class SearchController < ApplicationController

  def index
    base_url = 'https://api.instagram.com/v1/tags/'
    query_string = 'russiancircles/media/recent?access_token='
    token = ENV['INSTAGRAM_API_KEY']

    query_string2 = 'kylesa/media/recent?access_token='

    json = open(base_url + query_string + token).read 
    json_data = JSON.parse(json)
    all_rc_results = json_data["data"]
    all_rc_images = Hash.new
    all_rc_results.each do |result, value|
      if result["location"]
        all_rc_images[result["images"]["thumbnail"]["url"]] = result["location"]
      end
      all_rc_images
    end
    @all_rc_images = all_rc_images
    @all_rc_results = all_rc_results

    json2 = open(base_url + query_string2 + token).read 
    json2_data = JSON.parse(json2)
    all_kylesa_results = json2_data["data"]
    all_kylesa_images = Hash.new
    all_kylesa_results.each do |result, value|
      if result["location"]
        all_kylesa_images[result["images"]["thumbnail"]["url"]] = result["location"]
      end
      all_kylesa_images
    end
    @all_kylesa_images = all_kylesa_images
    @all_kylesa_results = all_kylesa_results

  end

  def show
  end

end