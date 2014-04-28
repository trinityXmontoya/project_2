class Auction < ActiveRecord::Base
  has_many_and_belongs_to_many :categories
  has_many :bids
  has_many :messages
  belongs_to :user
end

def time
  t = Time.now
  result = yield
  puts "\nCompleted in #{Time.now - t} seconds"
  result
end

class Timer
 def self.time(&block)
  start_time = Time.now
  result = block.call
  end_time = Time.now
  @time_taken = end_time - start_time
  result
 end

 def self.elapsedTime
  return @time_taken
 end

end


method:

is completed
check if the auction time limit is 0 then if it is, then set it to completed status to true,

another method whimenow - created atch calculates what the time limit is, the auction.ti

if auction.completed is true
  time remaining should be in jquery.

  time.now-time_limit = time_left


  user show controller, make a variable for each thing that the

  @badges = user.badge
  array of image url's that we would iterate through and then print out each one.
