require 'rest-client'
require 'json'

class GetGoogleCoffeeDetailsService
    def initialize(google_place_id)
        @google_place_id = google_place_id
    end

    def call
        begin
            base_url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{@google_place_id}&key=#{Rails.application.credentials.google_secret_key}"
            response = RestClient.get base_url
            value = JSON.parse(response.body)
        
        rescue RestClient::ExceptionWithResponse => e
            e.response
        end
    end
end