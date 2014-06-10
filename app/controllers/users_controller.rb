class UsersController < ApplicationController

  before_action :authenticate, only: [:show, :index, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      @auctions = @user.auctions{updated_at :desc}
      # @bids = @user.auctions.bids{updated_at :desc}
      @bids = Bid.retrieve_user_bids(@user)
      @outgoing_bids = Bid.retrieve_user_auction_bids(@user)
      @messages = @user.messages{updated_at :desc}
    end
    @badges = Category.retrieve_user_badges([1,2,3,4,5])
    # @badges = Category.retrieve_user_badges(@user.badges)

  end

  def edit
    @user = User.find(params[:id])
    if current_user == @user
      respond_to do |format|
        format.js {}
      end
    else
      redirect_to root_path
    end
  end

 def update
  @user = User.find(params[:id])
  if current_user == @user
    @user.update(user_params)
    redirect_to @user
  else
    redirect_to root_path
  end
end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :city, :bio, :zip_code, :location)
  end

end
