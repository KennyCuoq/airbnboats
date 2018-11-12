class BoatsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @boats = policy_scope(Boat)
  end

  def show
    @boat = Boat.find(params[:id])
    authorize @boat
    @booking = Booking.new
    @marker = [{
        lat: @boat.latitude,
        lng: @boat.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }]
  end

  def new
    @boat = Boat.new
    authorize @boat
  end

  def create

    @boat = Boat.new(boat_params)
    @boat.user = current_user
    authorize @boat
    if @boat.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @boat = Boat.find(params[:id])
    authorize @boat
    @boat.user = current_user
    @boat.destroy
    redirect_back(fallback_location: dashboard_path)
  end

  private
  def boat_params
    params.require(:boat).permit(:name, :boat_type, :description, :location, :daily_price, :capacity, :crew_number, :photo)
  end
end
