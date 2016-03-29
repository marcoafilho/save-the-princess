# `MapsController` handles the generation of random maps
class MapsController < ApplicationController
  before_action :authorize_user

  def show
    map = MapGenerator.new
    map.save
    respond_to do |format|
      format.json { render json: map.relative_path }
    end
  end
end
