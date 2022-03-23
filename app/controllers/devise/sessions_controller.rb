# frozen_string_literal: true

class Devise::SessionsController < DeviseController
  prepend_before_action :require_no_authentication, only: [:new, :create]
  prepend_before_action :allow_params_authentication!, only: :create
  prepend_before_action :verify_signed_out_user, only: :destroy
  prepend_before_action(only: [:create, :destroy]) { request.env["devise.skip_timeout"] = true }

  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
    
  
  end

  # POST /resource/sign_in
  def create
   
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
    # @user_logged = User.where("email = ?" ,params[:user][:email])
    # username = @user_logged.email
    elevator_deployed = Elevator.count
    number_of_building = Building.count
    quotes_await_processing = Quote.count
    leads_in_contacts = Lead.count
    number_of_batteries = Battery.count 
    custy = []
    Building.all.each do |building|
        custy.push(building.customer_id)
    end


    custy = custy.uniq



    inactive_elevator= []
    Elevator.all.each do |elevator|
      if elevator.status == "Inactive" 
        inactive_elevator.push(elevator.id)
      end
    end
    city = []
    
    Battery.all.each do |battery|
      
      building = Building.find(battery.building_id)
     
      
      customer = Customer.find(building.customer_id)
      
      address_id = Address.find(customer.address_id)
      city.push(address_id.city)



    end
    @date = Time.now
    user_email_before_split = params[:user][:email].split("@")
    user_email = user_email_before_split[0]
    #polly = Aws::Polly::Client.new(access_key_id: ENV['AWS_ACCESS_KEY_ID'],secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],region: 'us-west-1')
    # resp = polly.synthesize_speech({
    # output_format: "mp3",
    # text: '<speak>
    
    #           Hi  '+ user_email + '<break time="0.5s"/>  Welcome Back.
    #           <break time="1s"/> 
    #           As of today,' + @date.strftime("%d %b, %Y").to_s + '
    #           ,
    #           There are currently , ' +elevator_deployed.to_s + '
    #           elevators deployed in the, ' + number_of_building.to_s + '
    #           buildings of your  ' + custy.length().to_s + 'customers
    #           <break time="1s"/> 
    #           Currently, ' + inactive_elevator.length().to_s + ' elevators are not in Running Status and are being serviced
    #           <break time="1s"/> 
    #           You currently have ,' + quotes_await_processing.to_s + '  quotes awaiting processing
    #           <break time="0.5s"/> 
    #           and You currently have, ' + leads_in_contacts.to_s+ ' leads in your contact requests
    #           <break time="1s"/> 
    #           And last thing,' + number_of_batteries.to_s + ' Batteries are deployed across ' + city.length().to_s + ' cities
    #           <break time="0.5s"/> 
    #           Hope you enjoy yourday.
    #           </speak>',
    # text_type: "ssml", 
    # voice_id: "Joanna",
    # })
   # name = File.basename('speech')

    # Split up name so we get just the xyz part
   # parts = name.split('.')
    #first_part = parts[0]
   # mp3_file = first_part + '.mp3'
    
    #IO.copy_stream(resp.audio_stream, 'app/assets/audios/' + mp3_file)

    #puts 'Wrote MP3 content to: ' + mp3_file
  end

  # DELETE /resource/sign_out
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    respond_to_on_destroy
  end

  protected

  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in)
  end

  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { methods: methods, only: [:password] }
  end

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end

  def translation_scope
    'devise.sessions'
  end

  private

  # Check if there is no signed in user before doing the sign out.
  #
  # If there is no signed in user, it will set the flash message and redirect
  # to the after_sign_out path.
  def verify_signed_out_user
    if all_signed_out?
      set_flash_message! :notice, :already_signed_out

      respond_to_on_destroy
    end
  end

  def all_signed_out?
    users = Devise.mappings.keys.map { |s| warden.user(scope: s, run_callbacks: false) }

    users.all?(&:blank?)
  end

  def respond_to_on_destroy
    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name) }
    end
  end
end