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
  end

  def add_comment
    @bid = Bid.find(params[:id])
    @bid.update(comment: params[:bid][:comment])
    respond_to do |format|
      format.html { redirect_to @bid.auction}
      format.js   { }
    end
  end

end
