class Bid < ActiveRecord::Base

belongs_to :user
belongs_to :auction

has_many :categories

  def accept
    self.update(won: true)
  end

  def mark_as_viewed
    self.update(viewed: true)
  end

  def archive_bid
    self.update(archived: true)
  end

  #TODO
  # VALIDATE UNIQUENESS OF BID WITHIN SCOPE OF THE AUCTION_ID

end
