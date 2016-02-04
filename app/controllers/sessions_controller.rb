class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Successfully logged in'
    else
      @user = User.new
      @session_errors = ['Invalid password or e-mail']
      render 'pages/home'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
