class BidsController < ApplicationController


  def create
    @bid=Bid.new(user_id: params[:bid][:user_id], auction_id:params[:bid][:auction_id] , comment: params[:bid][:comment] )
    if current_user.bids.include? @bid.auction
      redirect_to @bid.auction, notice: "You may only bid on an auction once."
    else
      @bid.save
      respond_to do |format|
        format.html {redirect_to @bid.auction}
        format.js{}
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
