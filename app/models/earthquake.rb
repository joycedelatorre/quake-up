require 'json'
require 'httparty'

class Earthquake
  include HTTParty
  attr_reader :data
  def initialize(lat, lon, mag, radius)
    response = HTTParty.get("http://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&latitude=#{lat}&longitude=#{lon}&maxradiuskm=#{radius}&minmagnitude=#{mag}")
    @data = JSON.parse(response.body)
  end
end

# response = HTTParty.get("http://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&latitude=#{lat}&longitude=#{lon}&maxradiuskm=700")