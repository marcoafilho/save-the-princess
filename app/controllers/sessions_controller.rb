# `SessionsController` handles the authentication of a account.
class SessionsController < ApplicationController
  def create
    account = Account.with_credential(params[:credential])
    if account&.authenticate(params[:password])
      session[:account_id] = account.id
      redirect_to root_url, notice: 'Successfully logged in'
    else
      @account = Account.new
      @session_errors = ['Invalid password or e-mail']
      render 'pages/home'
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to root_path
  end
end
