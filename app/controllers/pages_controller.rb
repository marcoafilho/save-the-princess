# `PagesController` handles the static pages
class PagesController < ApplicationController
  def about
  end

  def home
    @user = User.new
  end
end
