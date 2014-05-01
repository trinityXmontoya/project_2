class AuctionParticipant < ActiveRecord::Base
  has_many :auctions
  has_many :users

  def self.find_participants(auction)
    participants = AuctionParticpant.where(auction: auction)
  end

end
