class Auction < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  has_many :categories
  has_many :bids
  has_many :messages
  belongs_to :user


end
