# `WorldsController` handles worlds objects
class WorldsController < ApplicationController
  before_action :authorize_user
  before_action :set_world, only: [:edit, :update, :destroy]

  def index
    @worlds = World.includes(:user).owner(params[:user_id])
  end

  def show
    @world = World.find(params[:id])
  end

  def new
    @world = current_user.worlds.new
  end

  def edit
  end

  def create
    @world = current_user.worlds.new(world_params)
    @world.map_path = MapGenerator.create.relative_path
    if @world.save
      redirect_to @world, notice: 'Successfully created world!'
    else
      render :new
    end
  end

  def update
    @world.map_path = MapGenerator.create.relative_path
    if @world.update(world_params)
      redirect_to @world, notice: 'Successfully created world!'
    else
      render :new
    end
  end

  def destroy
    @world.destroy

    redirect_to @worlds_path
  end

  private

  def world_params
    params.require(:world).permit(:name, :description)
  end

  def set_world
    @world = current_user.worlds.find(params[:id])
  end
end
