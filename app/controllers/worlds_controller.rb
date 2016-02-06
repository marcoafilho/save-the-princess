# `WorldsController` handles worlds objects
class WorldsController < ApplicationController
  before_action :authorize_user

  def new
    @world = current_user.worlds.new
  end

  def show
    @world = World.find(params[:id])
  end

  def create
    @world = current_user.worlds.new(world_params)

    if @world.save
      redirect_to @world, notice: 'Successfully created world!'
    else
      render :new
    end
  end

  private

  def world_params
    params.require(:world).permit(:name, :description)
  end
end
