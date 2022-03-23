require 'dad_jokes'
class QuoteController < ApplicationController
    
    def getData
        flash[:success] = ""
        quote = Quote.new

        #Customer Info
        quote.company_name = params['company_name']
        # quote.last_name = params['last_name']
        quote.email = params['email']
        quote.phone_number = params['phone_number']
   
        #Building Type
        quote.building_type = params["buildings"]

        # Elevator Type
        quote.services_type = params["radioSelect"]
        # Building Info
        quote.apartments = params["num_of_apts"]
        quote.floors = params["num_of_floors"]
        quote.basements = params["num_of_basements"]
        quote.companies = params["num_of_companies"]
        quote.parking_spots = params["num_of_parking"]
        quote.elevators = params["num_of_elevators"]
        quote.corporations = params["num_of_corporations"]
        quote.maximum_occupancy = params["max_occupancy"]
        quote.business_hours = params["business_hours"]
        
        #Price
        quote.total_price = params["total_price"].to_s
        
        quote.amount_of_elevator = params["amntElevator"]
        quote.price_per_elevator = params["priceElevator"]
        quote.installation = params["installation_fee"]
        quote.price_elevator_total = params["priceElevatorTotal"]
           

        if quote.save
            create_quote_ticket
           
            # flash[:success] = "Your Quote has been successfully submrailitted    "
            
            redirect_to root_path, flash: {success: "Your quote has been successfully submitted"}
         else
        
        
         
          end
     
    end


    def create_quote_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
            :subject => "The company #{params['company_name']}", 
            :comment => { 
                :value => "The contact company #{params['company_name']} 
                    can be reached at email #{params['email']} and at phone number #{params['phone_number']}. 
                    Building type selected is #{params["buildings"]} with the service type #{params["radioSelect"]}. 
                    The amount of required elevator is #{params["amntElevator"]} and total price is #{params["total_price"]}.\n"
                   
            }, 
            :requester => { 
                "name": params['email'], 
                "email": params['email'],
            },
            :priority => "normal",
            :type => "task",
            )
    end

   
end
