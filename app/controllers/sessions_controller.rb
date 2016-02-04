class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Successfully logged in'
    else
      @user = User.new
      flash.now.alert = 'Invalid e-mail or password'
      render 'pages/home'
    end
  end
end
