class BidsController < ApplicationController


  def create
    @bid=Bid.create()
    respond_to do |format|
      format.html {redirect_to @bid.auction}

  end

  def destroy
  end

  def add_comment
    @bid = Bid.find(params[:id])
    @bid.update(comment: params[:bid][:content])
    respond_to do |format|
      format.html { redirect_to @bid.auction}
      format.js   { }
    end
  end

end
