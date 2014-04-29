class BidsController < ApplicationController

  def new
    @bid = Bid.new
  end

  def create
  end

  def destroy
  end

  def add_comment
    @bid = Bid.find(params[:id])
    @bid.update(comment: params[:bid][:content])
    respond_to do |format|
      format.html { redirect_to @bid}
      format.js   { }
  end

end
