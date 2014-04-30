class AuctionsController < ApplicationController

  def index
    query = params[:query]
    @narrowed_results = Auction.search_for query
    # @user = current_user
    if params[:query].present?
      # find auctions based on lat, lng and radius
    else
      @auctions = Auction.all
    end
  end

  def show
    @auction = Auction.find params[:id]
    @user = @auction.user
    @bids = @auction.bids{updated_at :desc}
    @bids.mark_all_as_viewed
    @bid = Bid.new
  end


  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new
    if @auction.save
      latlng = @auction.get_location(@auction.location)
      @auction.save_location(latlng)

      redirect_to @auction
    else
      render 'new'
    end
  end

  def edit
    @auction = Auction.find_by(params[:id])
  end

  def update
    @auction = Auction.find_by(params[:id])
    @auction.update
      if @auction.save?
        redirect_to @auction
      else
        render 'edit'
      end
  end

  def destroy
    @auction = Auction.find_by(params[:id])
    @auction.destroy
    redirect_to '/'

  end

end
