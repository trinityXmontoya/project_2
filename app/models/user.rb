class User < ActiveRecord::Base
  has_many :bids
  has_many :auctions
  has_many :messages, through: :bids
  has_many :messages, through: :auctions
end
