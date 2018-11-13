class BookingsController < ApplicationController

  def create
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new(booking_params)
    authorize @booking
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
    authorize @booking
    @boat = Boat.find(params[:boat_id])
    @bookings = @boat.bookings
        @marker = [{
        lat: @boat.latitude,
        lng: @boat.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }]
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
    @boat = Boat.find(params[:boat_id])
        @marker = [{
        lat: @boat.latitude,
        lng: @boat.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }]
  end

  def update
    # raise
    @booking = Booking.find(params[:id])
    authorize @booking
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
    params.require(:booking).permit(:start_date, :end_date, :passenger_number, :status)
  end
end
