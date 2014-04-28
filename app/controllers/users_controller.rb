class UsersController < ApplicationController

  def show
    @user = User.find(parms[:id])
    @badges = @user.badges
    @messages = @user.messages
    @auctions = current_user ? current_user.auctions : []
    @bids = @user.bids
  end

  def new

  end

  def edit
  end

end
