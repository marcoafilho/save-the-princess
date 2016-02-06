# ApplicationController is the super class that handles the requests in an
# application level.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def authorize_user
    return if current_user.present?
    redirect_to root_path, alert: 'Must be logged in to access this feature'
  end
end
