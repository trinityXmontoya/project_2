class AuctionParticipant < ActiveRecord::Base
  has_many :auctions
  has_many :users
end
