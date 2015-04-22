require 'open-uri'
require 'json'

class ApiController < ApplicationController
  def pirate_form
  end

  def pirate_process
    #=== Instructions ===================================
    # Translate the text submitted from the pirate_form action
    # into pirate-speak
    #
    # Ref: http://isithackday.com/arrpi.php?
    #================================================
    english = params["text"]
    url = "http://isithackday.com/arrpi.php?text=#{english}&format=json"
    response = open(url).read
    translate = JSON.parse(response)
    message = translate["translation"]["pirate"]

    @result = message
  end


  def coord_form
    #=== Instructions ===================================
    # Create a form to send a user's address to the coord_process
    # action
    #================================================
  end

  def coord_process
    #=== Instructions ===================================
    # Using the Google geocoding API, find latitude and longitude
    # coordinates based on a user-submitted address. Send the
    # coordinates down to the view.
    #
    # Ref: https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA
    # as an example
    #================================================
    address = params["address"]
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{address}"
    response = open(url).read
    output = JSON.parse(response)
    @lat = output["results"][0]["geometry"]["location"]["lat"].round
    @lng = output["results"][0]["geometry"]["location"]["lng"].round

    @coords = [@lat, @lng]
  end

  def meme_gen_form
    #=== Instructions ===================================
    # Create a form to send a info to the meme_gen_process
    # action
    #
    # Ref: http://apimeme.com/
    #================================================
  end

  def meme_gen_process
    #=== Instructions ===================================
    # Create a meme based on user-submitted info
    #
    # Ref: http://apimeme.com/
    #================================================
    top_text = params["top_text"]
    bottom_text = params["bottom_text"]
    @result = "http://apimeme.com/meme?meme=Condescending+Wonka&top=#{top_text}&bottom=#{bottom_text}"
  end

  def congress_form
    #=== Instructions ===================================
    # Create a form to send a keyword to the congress_process
    # action
    #================================================
  end

  def congress_process
    #=== Instructions ===================================
    # Use the Library of Congress image API to display a relevant
    # picture based on a user-submitted keyword
    #
    # Ref: http://www.loc.gov/pictures/search/?q=computer&fo=json
    #================================================
    keyword = URI.encode(params[:keyword])
    url = "http://www.loc.gov/pictures/search/?q=#{keyword}&fo=json"
    response = open(url).read
    user_input = JSON.parse(response)
    image = user_input["results"][0]["image"]["full"]
    @result = image
  end

  def random_user
    #=== Instructions ===================================
    # Use the Radom User API to create a dynamic profile page
    # that changes on page refresh. Use at least 3 items from
    # the API response
    #
    # Ref: http://api.randomuser.me/
    #================================================

    url = "http://api.randomuser.me/"
    response = open(url).read
    user = JSON.parse(response)

    @name = user["results"][0]["user"]["name"]["first"]
    @gender = user["results"][0]["user"]["gender"]
    @picture = user["results"][0]["user"]["picture"]["medium"]
  end

  def wiki_image_form
    #=== Instructions ===================================
    # Create a form to send a keyword to the wiki_image_process
    # action
    #================================================

  end

  def wiki_image_process
    #=== Instructions ===================================
    # Use the Wikipedia API to display a relevant
    # picture or set of pictures based on a user-submitted keyword
    #
    # Ref: http://techslides.com/grab-wikipedia-pictures-by-api-with-php
    #================================================
    # keyword = URI.encode(params["keyword"])
    # url= "http://en.wikipedia.org/w/api.php?action=query&titles=File:#{keyword}.png&prop=imageinfo&iiprop=url&format=json"
    # image = open(url).read



    @result = output
  end

  def nearest_station_form
    #=== Instructions ===================================
    # Use the Divvy API to display all stations that have at least
    # 5 bikes available
    #
    # Bonus: Sort the stations by distance from a user-submitted
    # address
    #
    # Ref: http://www.divvybikes.com/stations/json/
    #================================================
  end

  def nearest_station_process
    location = URI.encode(params[:location])
    url = "http://www.divvybikes.com/stations/json/"
    response = open(url).read
    basic = JSON.parse(response)


  end
end
