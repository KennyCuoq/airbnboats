class BoatsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @boats = policy_scope(Boat)
    @types = Boat.all.pluck(:boat_type).uniq
    @prices = Boat.all.pluck(:daily_price).uniq
    # byebug
    @boats = @boats.where(boat_type: params[:filter_type]) if params[:filter_type].present?
    @boats = @boats.where("daily_price < ?", params[:filter_price].to_i) if params[:filter_price].present?
    @boats = @boats.where("capacity >= ?", params[:filter_capacity].to_i) if params[:filter_capacity].present?
    @boats = @boats.where("crew_number >= ?", params[:filter_crew].to_i) if params[:filter_crew].present?
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
