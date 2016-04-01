# `AccountsController` handles the creation of accounts.
class AccountsController < ApplicationController
  def create
    @account = Account.new(account_params)

    if @account.save
      session[:account_id] = @account.id
      redirect_to root_url, notice: "Welcome, #{@account}!"
    else
      render 'pages/home'
    end
  end

  private

  def account_params
    params.require(:account).permit(:username, :email, :password)
  end
end
