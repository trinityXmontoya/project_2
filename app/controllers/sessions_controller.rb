class SessionsController < Application Controller

  def create
    # FIXME does this need a block / slice method to extract the info
    @user = User.find_or_create_from_auth_hash(auth_hash)
    current_user = @user
    @user.id = auth_hash['uid']
    @user.oauth_token=auth_hash['credentials']['token']
    @user.name = auth_hash['info']['first_name']
    @user.profile_photo = auth_hash['info']['image']
    @user.location = auth_hash['info']['location']
    @user.save!
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
