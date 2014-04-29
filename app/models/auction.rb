class Auction < ActiveRecord::Base

  has_many :categories
  has_many :bids
  has_many :messages
  belongs_to :user

  def get_location(address)
    address = address.downcase.gsub(" ", "+")
    latlng = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=true&key=#{ENV['GOOGLE_GEOCODING_KEY']}")['results'][0]['geometry']['location']
  end

  def save_location(latlng)
    self.latitude = latlng['lat']
    self.longitude = latlng['lng']
  end

end
