require 'json'
require 'httparty'

class Location
  include HTTParty
  attr_reader :latitude, :longitude
  def initialize(zipcode)
    response = HTTParty.get("http://dev.virtualearth.net/REST/v1/Locations?query=#{zipcode}&maxResults=1&key=AoDr5MEui79AfoP3WYelO5Aq6tEoJcDKGz-1AYUw7LVvRpraeVbKl39Ws-Hlfyqw")
    data = JSON.parse(response.body)
    @latitude = data["resourceSets"][0]["resources"][0]["point"]["coordinates"][0]
    @longitude = data["resourceSets"][0]["resources"][0]["point"]["coordinates"][1]
  end
end
