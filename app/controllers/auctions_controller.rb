class AuctionsController < ApplicationController

  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.find params[:id]
    @user = @auction.user
    @bids = @auction.bids{updated_at :desc}
    @bids.each {|bid| bid.mark_as_viewed}
    @bid = Bid.new
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    if @auction.save
      results = @auction.get_location(@auction.location)
      @auction.save_location(results)
      @auction.save
      redirect_to @auction
    else
      render 'new'
    end
  end

  def edit
    @auction = Auction.find(params[:id])
    if @auction.update
      latlng = @auction.get_location(@auction.location)
      @auction.save_location(latlng)
      @auction.update

      redirect_to @auction
    else
      render 'edit'
    end
  end

  def update
    @auction = Auction.find(params[:id])
    @auction.update
      if @auction.save?
        redirect_to @auction
      else
        render 'edit'
      end
  end

  def destroy
    @auction = Auction.find(params[:id])
    @auction.destroy
    redirect_to '/'
  end

  private
  def auction_params
    params.require(:auction).permit(:user_id, :category_id, :location, :title, :description, :time_limit, :completed, :viewed, :latitude, :longitude)
  end

end
