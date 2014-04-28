class Auction < ActiveRecord::Base
  has_many_and_belongs_to_many :categories
  has_many :bids
  has_many :messages
  belongs_to :user
end
