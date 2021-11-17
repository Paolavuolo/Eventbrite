class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @events = Event.all
  end
  def show
    @event = Event.find(params[:id])
    @count = count 
    @attendances = participated?
  end 
  def def new
    @event = Event.new
  end
  def create
    @event = Event.new(titlte:params[:titlte], description:params[:description], duration:params[:duration], location:params[:location], start_date:params[:start_date], price:params[:price], createur: current_user)
    if @event.save
      redirect_to event_path(@event.id)
      flash[:success]="Evènement créé avec succès"
    else
      render new_event_path
    end
  end

  private 

  def count 
    Event.find(params[:id]).attendances.all.count
  end 

  def participated?
    Event.find(params[:id]).attendances.ids
  end 
  
end
