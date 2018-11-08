class BookingsController < ApplicationController

  def create
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.boat = @boat
    if @booking.save
      redirect_to boat_booking_path(@boat, @booking)
    else
      render "boats/show"
    end
  end

  def show
    # @booking = Booking.find(params[:id])
  end

  def patch
  end

  def edit
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :passenger_number, :total_price)
  end
end
