class Elevator < ApplicationRecord
    belongs_to :column
    before_save do
        if ((status_was != nil) and (status_was != "Intervention") and (status == "Intervention"))
            sms_tech()
        end
    end
    

    # TWILIO
    def sms_tech
        # Download the helper library from https://www.twilio.com/docs/ruby/install
        require 'rubygems'
        require 'twilio-ruby'

        # Find your Account SID and Auth Token at twilio.com/console
        # and set the environment variables. See http://twil.io/secure
        account_sid = ENV["twilio_acct_id"]
        auth_token = ENV["twilio_auth"]
        @client = Twilio::REST::Client.new(account_sid, auth_token)

        from = '+19312297846' # Your Twilio number
        to = '+12896393896'  # Your mobile phone number


        # message = @client.messages.create( 
        #     body: "The Elevator with ID: '#{self.id}' in building ID: '#{self.column.battery.building.id}' status has changed from '#{self.status_was}' to '#{self.status}'",  
        #     messaging_service_sid: 'MG2754996d4ee4b712f6349f39ebe93a0f',      
        #     to: '+12896393896' 
        #   ) 

        # puts message.sid
         
        # message = @client.messages.create( 
        #                              body: "The Elevator with ID: '#{self.id}' in building ID: '#{self.column.battery.building.id}' status has changed from '#{self.status_was}' to '#{self.status}'",  
        #                              messaging_service_sid: 'ENV["messaging_sid"]',      
        #                              to: '+12896393896' 
        #                            ) 
         
        # puts message.sid


        message = @client.messages.create( 
            body: "The Elevator with ID: '#{self.id}' in building ID: '#{self.column.battery.building.id}' status has changed from '#{self.status_was}' to '#{self.status}'",    
            messaging_service_sid: ENV["messaging_sid"],      
            to: '+12896393896' 
          ) 
        
    end

    around_update :send_to_slack

    private

    def send_to_slack

        require 'slack-notifier'

        notify = self.status_changed?
        puts ENV['slack_api']
        if notify
            notifier = Slack::Notifier.new ENV['slack_api']
            notifier.ping "The Elevator with ID: '#{self.id}' with Serial Number: '#{self.serial_number}' status has changed from '#{self.status_was}' to '#{self.status}'"
        end
        yield
    end

end

