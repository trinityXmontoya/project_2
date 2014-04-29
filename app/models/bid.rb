class Bid < ActiveRecord::Base

belongs_to :user
belongs_to :auction

has_many :categories

 def mark_all_as_viewed
    self.each do |bid|
      bid.update(viewed: true)
    end
  end

end
