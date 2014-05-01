class AuctionsController < ApplicationController

  def index
    @auctions = Auction.all
    @search = Search.new
    @categories = Category.all
  end

  def show
    @auction = Auction.find(params[:id])
    @user = @auction.user
    @bids = @auction.bids{created_at :desc}
    # @bids.each {|bid| bid.mark_as_viewed}
    @bid = Bid.new
    @message = Message.new
    # @auction_category = @auction.get_category(@auction)
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.add_end_time(@auction.time_end)
    if @auction.save
      results = @auction.get_location(@auction.address)
      @auction.save_location(results)
      @auction.save
      redirect_to @auction
    else
      render 'new', notice: "Please fix the following errors."
    end
  end


  def edit
    @auction = Auction.find(params[:id])
    if @auction.update
      latlng = @auction.get_location(@auction.address)
      @auction.save_location(latlng)
      @auction.update

      redirect_to @auction
    else
      render 'edit'
    end
  end

  def update
    @auction = Auction.find(params[:id])
    @auction.update auction_params
    if @auction.save
      results = @auction.get_location(@auction.location)
      @auction.save_location(results)
      @auction.save
      redirect_to @auction
    else
      render 'edit'
    end
  end

  def accept_badge
    if self.auction_participants.includes? current_user
      current_user.badges << auction.category.id
        respond_to do |format|
        format.html{redirect_to @auction}
        format.js {}
      end
    end
  end

  def destroy
    @auction = Auction.find(params[:id])
    @auction.destroy
    redirect_to '/'
  end

  def create_tweet
    tweet_string = params[:tweet]
    @send_code = Tweet.create_tweet(tweet_string)
    render text: @send_code
  end

  private
  def auction_params
    params.require(:auction).permit(:user_id, :category_id, :location, :title, :description, :time_begin, :time_end, :event_date, :completed, :num_of_req_bids, :address, :website, :img_url, :notifications_sent, :created_at, :updated_at, :latitude, :longitude)
  end

end
