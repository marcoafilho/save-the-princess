# ApplicationController is the super class that handles the requests in an
# application level.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_account
    @current_account ||= Account.find_by(id: session[:account_id])
  end
  helper_method :current_account

  def authorize_account
    return if current_account.present?
    redirect_to root_path, alert: 'Must be logged in to access this feature'
  end
end
