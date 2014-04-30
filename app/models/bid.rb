class Bid < ActiveRecord::Base

belongs_to :user
belongs_to :auction

has_many :categories

 def mark_as_viewed
    self.update(viewed: true)
  end

  def archive_bid
    self.update(archived: true)
  end

end
