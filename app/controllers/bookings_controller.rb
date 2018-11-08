class BookingsController < ApplicationController

  def create
    # @booking = Booking.new(booking_params)
    # @booking.user_id = current_user.id
    # @booking.save
    # redirect_to booking_path(@booking)
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
    # params.require(:booking).permit(:boat_id, :start_date, :end_date, :passenger_number, :total_price)
  end
end
