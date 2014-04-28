class SessionsController < Application Controller

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    @user.id = auth_hash['uid']
    @user.oauth_token=auth_hash['credentials']['token']
    @user.name = auth_hash['first_name']

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
