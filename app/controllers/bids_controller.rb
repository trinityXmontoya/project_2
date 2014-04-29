class BidsController < ApplicationController

  def index
  end

  def show
    @bid = Bid.find(params[:id])
    @bidder = @bid.user
    @auction = @bid.auction
    @user = @auction.user
  end

  def new
    @bid = Bid.new
  end


  def add_comment
    @bid = Bid.find(params[:id])
    @bid.update(comment: params[:bid][:content])
    respond_to do |format|
      format.html { redirect_to @bid}
      format.js   { }
  end

end
