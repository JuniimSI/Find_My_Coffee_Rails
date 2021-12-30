require 'rest-client'
require 'json'

class GetGoogleCoffeeListService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end
  
  def call
    begin
      location = "location=#{@latitude},#{@longitude}"
      base_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffee+shop&#{location}&radius=3000&key=#{Rails.application.credentials.google_secret_key}"
      response = RestClient.get base_url
      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end