class User < ActiveRecord::Base
  has_many :bids, through: :auction
  has_many :auctions
  has_many :messages, through: :bids
  has_many :messages, through: :auctions
end

