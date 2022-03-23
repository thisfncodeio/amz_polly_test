require 'net/http'
require 'json'

module ElevatorMedia
    class Streamer
        def getContent
            @api_key = ENV['AIRNOW_KEY']
            @uri = URI("https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=10001&distance=25&API_KEY=9E97D53C-3F08-4421-A939-E67E7FD7429B")
            @response = Net::HTTP.get(@uri)
            @response_in_JSON = JSON.parse(@response)
            @AQI = @response_in_JSON[0]["AQI"]
           
            
            if @AQI <= 50 
                @level = 'Good'
            elsif @AQI > 50 and @AQI <= 100
                @level = 'Moderate'
            elsif @AQI > 100 and @AQI <= 150
                @level = 'Unhealthy for Sensitive Groups'
            elsif @AQI > 150 and @AQI <= 200
                @level = 'Unhealthy'
            elsif @AQI > 200 and @AQI <= 300
                @level = 'Very Unhealthy'
            else @AQI > 300
                @level = 'Hazardous'
            end
            output = 
            "<div> 
                <p> Today Air Quality Index in New York is: </p>

                <h3> #{@AQI} - #{@level} </h3>
            </div>"
        end
    end
end


