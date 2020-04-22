class EventsController < ApplicationController

  def index
    @events = Event.all.paginate(page: params[:page], per_page: 100)
  end

  def show
    @event = Event.find(params[:id])
    @singular = true
  end

  def new
    @event = current_user.events.build
  end

  def create 
    puts params[:start_time]
    @user = current_user
    if @user
      @event = @user.events.build(event_params)
      render :index
    end
  end

  private 

  def time_parse(time)
    DateTime.strptime(time, '%m/%d/%Y %M:%S %p')
  end

  def event_params
    params.require(:event).permit(:event)
  end

end

