class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
    @booking = Booking.new
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.user = current_user
    @boat.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def boat_params
    params.require(:boat).permit(:name, :boat_type, :description, :location, :daily_price, :capacity, :crew_number, :photo)
  end
end
