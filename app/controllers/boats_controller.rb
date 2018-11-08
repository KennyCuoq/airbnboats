class BoatsController < ApplicationController
  def index
  end

  def show
    @boat = Boat.find(params[:id])
    @booking = Booking.new
  end

  def new
  end

  def create
  end

  def destroy
  end
end
