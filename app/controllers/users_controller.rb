# `UsersController` handles the creation of users.
class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url, notice: "Welcome, #{@user.name}!"
    else
      render 'pages/home'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
