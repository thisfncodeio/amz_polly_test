class ElevatorsController < ApplicationController
    
    def get_elevators_by_column
        @elevators = Elevator.where("column_id = ?", params[:column_id])
        respond_to do |format|
            format.json { render :json => @elevators }
        end
    end

end