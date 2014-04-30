class Search < ActiveRecord::Base

  def get_location(address)
    escaped_address = address.downcase.gsub(" ", "+")
    results = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{escaped_address}&sensor=true&key=#{ENV['GOOGLE_GEOCODING_KEY']}")
  end

  def save_location(results)
    self.latitude = results['results'][0]['geometry']['location']['lat']
    self.longitude = results['results'][0]['geometry']['location']['lng']
  end

  def calculate_results(search_lat, search_long, distance)
    results = []
    search_lat = self.latitude
    search_long = self.longitude


    # how do i get all auctions in here?
    Auction.all.each do |auction|

      # a = search_lat - auction.latitude
      # b = search_long - auction.longitude
      # c = (a ** 2) + (b ** 2)
      # search_distance = Math.sqrt(c)
      # # distance and how far need to be the same type of measurement
      # if search_distance < distance
      #   results << auction
      # end

      if haversine(search_lat ,search_long ,auction.latitude ,auction.longitude) <= distance
        return auction
      end
    end
    # return results
  end

  def self.haversine(lat1, long1, lat2, long2)
    dtor = Math::PI/180
    r = 6378.14*1000

    rlat1 = lat1 * dtor
    rlong1 = long1 * dtor
    rlat2 = lat2 * dtor
    rlong2 = long2 * dtor

    dlon = rlong1 - rlong2
    dlat = rlat1 - rlat2

    a = power(Math::sin(dlat/2), 2) + Math::cos(rlat1) * Math::cos(rlat2) * power(Math::sin(dlon/2), 2)
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
    d = r * c

    return d
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
