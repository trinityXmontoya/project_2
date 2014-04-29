class Auction < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  has_many :categories
  has_many :bids
  has_many :messages
  belongs_to :user

  def mark_as_viewed
    self.update(viewed: true)
  end

end
