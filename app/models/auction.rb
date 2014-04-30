class Auction < ActiveRecord::Base

  has_many :categories
  has_many :bids
  has_many :messages
  belongs_to :user
  belongs_to :auction_participants

  # def self.search_for(query)
  #   # self.where('')
  #   # self.latitude
  #   # self.longitude
  # end

  def get_location(address)
    escaped_address = address.downcase.gsub(" ", "+")
    latlng = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{escaped_address}&sensor=true&key=#{ENV['GOOGLE_GEOCODING_KEY']}")['results'][0]['geometry']['location']
  end

  def save_location(latlng)
    self.latitude = latlng['lat']
    self.longitude = latlng['lng']
  end

  def get_coords(zipcode)
    zip = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{zipcode}&components=postal_code&sensor=false&key=#{ENV['GOOGLE_GEOCODING_KEY']}")
  end

  def calculate_time_left
    return Time.now - time_limit
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

end
