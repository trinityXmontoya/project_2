class BidsController < ApplicationController

  def create
    @auction = Auction.find(params[:auction_id])
    @bid=Bid.new(auction: @auction, user: current_user, comment: params[:bid][:'comment'] )
    if current_user.bids.include? @auction
      redirect_to @auction, notice: "You may only bid on an auction once."
    else
      @bid.save
      respond_to do |format|
        format.html {redirect_to @auction}
        format.js{}
      end
    end
  end


  def accept_bid
    @bid = Bid.find(params[:bid][:id])
    unless auction.is_completed?
    @bid.accept
      @bid.auction.calculate_accepted_bids
    respond_to do |format|
        format.html {redirect_to @bid.auction}
        format.js{}
      end
    else
      redirect_to @bid.auction, notice: "Bidding for this auction is closed."
    end
  end


  def destroy
    @bid=Bid.find(params[:id])
    @auction = @bid.auction
    @bid.destroy
     respond_to do |format|
        format.html {redirect_to @auction}
        format.js{}
      end
  end

  private
  def bid_params
    params.require(:bid).permit(:bid)
  end

end
