class BoatsController < ApplicationController
  def index
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end
end
