class AuctionsController < ApplicationController

  def index
    # @user = current_user
    if params[:search].present?
      # find auctions based on lat, lng and radius
    else
      @auctions = Auction.all
    end
  end

  def show
    @auction = Auction.find params[:id]
  end

  def show
    @message.update(viewed: true)
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
  end

end
