
class HomeController < ApplicationController
  invisible_captcha only: [:create]

  def index

      @lead = Lead.new

  end




  def create
    @lead = Lead.new(lead_params)
   
    if params[:lead][:upload]
      @lead.attachment = params[:lead][:upload].read
      @lead.filename = params[:lead][:upload].original_filename
    end

    if @lead.save
      ThankYouMailer.send_thank_you_email(@lead).deliver   
      create_lead_ticket
      # flash[:success] = "Your Quote has been successfully submitted    "
      redirect_to root_path, flash: {success: "Your Message has been successfully submitted"}
    end
  end

  def create_lead_ticket
    client = ZendeskAPI::Client.new do |config|
        config.url = ENV['ZENDESK_URL']
        config.username = ENV['ZENDESK_USERNAME']
        config.token = ENV['ZENDESK_TOKEN']
    end
    ZendeskAPI::Ticket.create!(client, 
        :subject => "#{params[:lead][:full_name].titleize} from #{params[:lead][:company_name].titleize}", 
        :comment => { 
            :value => "The contact #{params[:lead][:full_name].titleize} from company #{params[:lead][:company_name].titleize} can be reached at email  #{params[:lead][:email]} and at phone number #{params[:lead][:phone_number]}. 
            #{params[:lead][:department].titleize} has a project named #{params[:lead][:project_name].titleize} which would require contribution from Rocket Elevators.
            Project Description: #{params[:lead][:project_description]}\n\n
            Attached Message: #{params[:lead][:message]}\n\n
            The Contact uploaded an attachment"
        }, 
        :requester => { 
            "name": @lead.email, 
            "email": @lead.email,
        },
        :priority => "normal",
        :type => "question"
    )
  end
  


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pin
    @lead = Lead.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lead_params
    params.require(:lead).permit(:full_name,:email,:phone_number,:company_name,:project_name,:project_description,:department,:message)
  end
end