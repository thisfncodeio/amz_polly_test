class BuildingsController < ApplicationController
    
    def get_buildings_by_customer
        @buildings = Building.where("customer_id = ?", params[:customer_id])
        puts @buildings.to_a.inspect
        respond_to do |format|
            format.json { render :json => @buildings }
        end
    end

end