class Auction < ActiveRecord::Base
  geocoded_by :address
  # after_validation :geocode, :if => :address_changed?

  has_many :categories
  has_many :bids
  has_many :messages
  belongs_to :user
  belongs_to :auction_participants


end


# method:

# is completed
# check if the auction time limit is 0 then if it is, then set it to completed status to true,

# another method whimenow - created atch calculates what the time limit is, the auction.ti

# if auction.completed is true
#   time remaining should be in jquery.

#   time.now-time_limit = time_left


#   user show controller, make a variable for each thing that the

   def time_left
      return time_limit - Time.now
    end

   def is_completed?
      if time_left > 0
        return false
      else
        self.update(completed: true)
        self.save!
      return true
    end
  end
