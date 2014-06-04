class SessionsController < ApplicationController

  def create
    user = User.facebook_auth(auth_hash)
    session[:user_id] = user.uid
    redirect_to '/'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: "Logged out."
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end

end
