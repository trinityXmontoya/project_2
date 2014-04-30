class Search < ActiveRecord::Base

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

  # def haversine(lat1, lng1, lat2, lng2)
  #   dtor = Math::PI/180
  #   radius_miles = 3959

  #   rlat1 = lat1 * dtor
  #   rlng1 = lng1 * dtor
  #   rlat2 = lat2 * dtor
  #   rlng2 = lng2 * dtor

  #   dlng = rlng1 - rlng2
  #   dlat = rlat1 - rlat2

  #   a = (Math::sin(dlat / 2) ** 2) + Math::cos(rlat1) * Math::cos(rlat2) * (Math::sin(dlng / 2) ** 2)
  #   c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))
  #   d = radius_miles * c

  #   return d
  # end

  def auctions
    @auctions ||= get_auctions
  end

  private
  def get_auctions
    auctions = Auction.all.order(:location)
    # rails AR queries for lat and lng on database
  end

end

      # a = search_lat - auction.latitude
      # b = search_lng - auction.longitude
      # c = (a ** 2) + (b ** 2)
      # search_distance = Math.sqrt(c)
      # # distance and how far need to be the same type of measurement
      # if search_distance < distance
      #   results << auction
      # end
