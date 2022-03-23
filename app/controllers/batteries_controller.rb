class BatteriesController < ApplicationController
    
    def get_batteries_by_building
        @batteries = Battery.where("building_id = ?", params[:building_id])
        respond_to do |format|
            format.json { render :json => @batteries }
        end
    end

end