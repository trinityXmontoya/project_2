class BidsController < ApplicationController


  def create
    @auction = Auction.find(params[:auction_id])
    @bid=Bid.new(auction: @auction, user: @auction.user, comment: params[:bid][:comment] )
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

  def destroy
    @bid=Bid.find(params[:id])
    @auction = @bid.auction
    @bid.destroy
     respond_to do |format|
        format.html {redirect_to @auction}
        format.js{}
      end
  end

end
