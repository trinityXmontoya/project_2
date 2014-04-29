class Auction < ActiveRecord::Base

  has_many :categories
  has_many :bids
  has_many :messages
  belongs_to :user

  def get_location(address)
    address = address.downcase.gsub(" ", "+")
    latlng = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=true&key=#{ENV['GOOGLE_GEOCODING_KEY']}")['results'][0]['geometry']['location']
  end

  def save_location(&latlng) #this needs to take a block, doesn't work yet
    self.latitude = latlng['lat']
    self.longitude = latlng['lng']
  end

end

# [4] pry(main)> latlng = a.get_location(a.location)
# => {"lat"=>40.7056308, "lng"=>-73.9780035}
# [5] pry(main)> save = a.save_location(latlng)
# ArgumentError: wrong number of arguments (1 for 0)
# from /Users/alexshook/code/project_2/app/models/auction.rb:13:in `save_location'
# [6] pry(main)> save = a.save_location(&latlng)
# TypeError: wrong argument type Hash (expected Proc)
# from (pry):6:in `__pry__'
# [7] pry(main)>
