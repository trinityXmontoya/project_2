class Search < ActiveRecord::Base

  def get_location(address)
    escaped_address = address.downcase.gsub(  " ", "+")
    results = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{escaped_address}&sensor=true&key=#{ENV['GOOGLE_GEOCODING_KEY']}")
  end

  def save_location(results)
    self.latitude = results['results'][0]['geometry']['location']['lat']
    self.longitude = results['results'][0]['geometry']['location']['lng']
  end

  def auctions
    @auctions ||= get_auctions
  end

  private
  def get_auctions
    auctions = Auction.order(:location)
    # rails AR queries for lat and lng on database
  end

end
