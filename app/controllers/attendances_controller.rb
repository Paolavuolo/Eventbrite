class AttendancesController < ApplicationController
    def new
        Event.find(params[:event_id]).price*100
    end 

    def create
    end 
end
