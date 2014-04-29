class Auction < ActiveRecord::Base
  geocoded_by :address
  # after_validation :geocode, :if => :address_changed?

  has_many :categories
  has_many :bids
  has_many :messages
  belongs_to :user
  belongs_to :auction_participants


  def calculate_time_left
    return Time.now - time_limit
  end
end
