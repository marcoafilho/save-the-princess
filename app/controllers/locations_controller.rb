# `LocationsController` handles the location object
class LocationsController < ApplicationController
  before_action :authorize_user

  def new
    @location = Location.new(world_id: params[:world_id])
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to world_path(@location.world_id)
    else
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(:world_id, :name, :description, :latitude, :longitude)
  end
end
