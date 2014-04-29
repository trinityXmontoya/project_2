class BidsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @bid = Bid.new
  end

 def edit
    @bid = Bid.find_by(params[:id])
  end
end
