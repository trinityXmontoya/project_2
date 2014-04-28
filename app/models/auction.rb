class Auction < ActiveRecord::Base
  has_many :categories
  has_many :bids
  has_many :messages
  belongs_to :user

end
