# `PagesController` handles the static pages
class PagesController < ApplicationController
  def about
  end

  def home
    @account = Account.new
  end
end
