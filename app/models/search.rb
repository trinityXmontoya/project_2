class Search < ActiveRecord::Base

  validates :keywords, presence: true

  def get_location(address)
    escaped_address = address.downcase.gsub(" ", "+")
    results = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{escaped_address}&sensor=true&key=#{ENV['GOOGLE_GEOCODING_KEY']}")
  end

  def save_location(results)
    self.latitude = results['results'][0]['geometry']['location']['lat']
    self.longitude = results['results'][0]['geometry']['location']['lng']
  end

  def calculate_results(search_lat, search_lng, distance)
    results = []
    search_lat = self.latitude
    search_lng = self.longitude

    Auction.all.each do |auction|
      searched_distance = auction.haversine(search_lat, search_lng, auction.latitude, auction.longitude)
      if searched_distance <= distance
        results << auction
      end
    end
    return results
  end

end
