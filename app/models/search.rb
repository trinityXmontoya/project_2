class Search < ActiveRecord::Base

  def auctions
    @auctions ||= get_auctions
  end

  private
  def get_auctions
    auctions = Auction.order(:location)
    # rails AR queries for lat and lng on database
  end

end
