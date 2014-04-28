class Auction < ActiveRecord::Base
  has_many_and_belongs_to_many :categories
  has_many :bids
  has_many :messages
  belongs_to :user
end


# method:

# is completed
# check if the auction time limit is 0 then if it is, then set it to completed status to true,

# another method whimenow - created atch calculates what the time limit is, the auction.ti

# if auction.completed is true
#   time remaining should be in jquery.

#   time.now-time_limit = time_left


#   user show controller, make a variable for each thing that the
