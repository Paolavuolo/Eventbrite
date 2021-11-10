class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  def show
    @event = Event.find(params[:id])
  end 
  def def new
    @event = Event.new
  end
  def create
    @event = Event.new(params_event)
    @event.admin_id = current_user.id
    if @event.save
      redirect_to event_path(@event.id)
      flash[:success]="Evènement créé avec succès"
    else
      render new_event_path
    end
  end

  private 
  def params_event
    params.require(:event).permit(:start_date, :duration, :titlte, :price, :description, :location)
  end 
  
end
