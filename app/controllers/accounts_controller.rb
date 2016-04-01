# `AccountsController` handles the creation of accounts.
class AccountsController < ApplicationController
  before_action :set_account, only: %i(edit update)

  def edit
  end

  def create
    @account = Account.new(create_account_params)

    if @account.save
      session[:account_id] = @account.id
      redirect_to root_url, notice: "Welcome, #{@account}!"
    else
      render 'pages/home'
    end
  end

  def update
    if @account.update(update_account_params)
      redirect_to edit_account_path(current_account), notice: 'Profile successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_account
    @account = current_account
  end

  def create_account_params
    params.require(:account).permit(:username, :email, :password)
  end

  def update_account_params
    params.require(:account).permit(:name)
  end
end
