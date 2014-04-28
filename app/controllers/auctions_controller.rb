class AuctionsController < ApplicationController
  def index
    @auctions = Auction.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
