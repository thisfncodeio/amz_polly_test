class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]

  # GET /interventions or /interventions.json

  def index
    @interventions = Intervention.all
  end
  
  # GET /interventions/1 or /interventions/1.json

  # GET /interventions/new
  def new
    #redirect_to root_path unless user_signed_in?
    @intervention = Intervention.new
  end

  # GET /interventions/1/edit

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)

    
    respond_to do |format|
      if @intervention.save
        format.html { redirect_to root_path, notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
        create_intervention_ticket()
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end



  def create_intervention_ticket
    client = ZendeskAPI::Client.new do |config|
        config.url = ENV['ZENDESK_URL']
        config.username = ENV['ZENDESK_USERNAME']
        config.token = ENV['ZENDESK_TOKEN']
    end
    ZendeskAPI::Ticket.create!(client, 
        :subject => "New Intervention has been created", 
        :comment => { 
            :value => "
            Customer: #{@intervention.customer.company_name}\n
            Building ID: #{@intervention.building_id}\n
            Battery ID: #{@intervention.battery_id}\n
            Column ID: #{@intervention.column_id}\n
            Elevator ID: #{@intervention.elevator_id}\n
            Employee: #{@intervention.employee.first_name} #{@intervention.employee.last_name}\n
            Description: #{@intervention.report}"
        }, 
        :requester => { 
            "name": @intervention.author.email, 
           
        },
        :priority => "normal",
        :type => "question"
    )
  end

  # PATCH/PUT /interventions/1 or /interventions/1.json
 

  # DELETE /interventions/1 or /interventions/1.json
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.require(:intervention).permit(:author_id, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :report)
    end
end
