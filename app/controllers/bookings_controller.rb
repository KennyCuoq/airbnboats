class BookingsController < ApplicationController

  def create
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.boat = @boat
    @booking.total_price = ((@booking.end_date - @booking.start_date).to_i + 1) * @boat.daily_price
    if @booking.save
      redirect_to boat_booking_path(@boat, @booking)
    else
      render "boats/show"
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @boat = Boat.find(params[:boat_id])
    @bookings = @boat.bookings
  end

  def edit
    @booking = Booking.find(params[:id])
    @boat = Boat.find(params[:boat_id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    @booking.total_price = (@booking.end_date - @booking.start_date).to_i * @booking.boat.daily_price
    if @booking.save
      redirect_to boat_booking_path(@booking.boat, @booking)
    else
      render "boats/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :passenger_number)
  end
end
