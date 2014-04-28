class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    session[:] ? User.find(session[:user]) : nil
  end

  def authenticate
    unless current_user
    redirect_to root_path, notice: "You must login to continue"
    end
  end

end
