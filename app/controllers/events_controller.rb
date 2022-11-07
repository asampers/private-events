class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash.notice = "#{@event.title} was successfully created."
      redirect_to :root
    else 
      render :new, status: :unprocessable_entity
    end    
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:title, :body, :date, :location )
  end
end
