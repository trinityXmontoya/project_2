class Auction < ActiveRecord::Base

  has_many :categories
  has_many :bids
  has_many :messages
  belongs_to :user
  belongs_to :auction_participants

  def get_location(address)
    escaped_address = address.downcase.gsub(" ", "+")
    results = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{escaped_address}&sensor=true&key=#{ENV['GOOGLE_GEOCODING_KEY']}")
  end

  def save_location(results)
    self.latitude = results['results'][0]['geometry']['location']['lat']
    self.longitude = results['results'][0]['geometry']['location']['lng']
  end

  def calculate_time_left
    return Time.now - time_limit
  end

   def time_left
      return time_end - time_begin
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

    def end_auction
        notify_participants
        mark_notifications_sent
        archive_bids
        close_messaging
    end

    def notify_participants
      #notify the auction creator
      message_user

      bids.each do |bid|
        if bid.won
          #notify winners of the auction
          message_winner(bid.user)
        else
          #notify losers of the auction
          message_loser(bid.user)
        end
      end
    end

    def message_user(bid)
      Message.auction_user(self,bid.user)
    end

    def message_winner
      Message.auction_winner(self,user)
    end

    def message_loser(bid)
      Message.auction_loser(self,bid.user)
    end

    def mark_notifications_sent
      self.update(notifications_sent: true)
      return true
    end

    def archive_bids
      bids.each do |bid|
        bid.archive_bid
      end
    end

    def close_messaging
      #will work on this method after messages is done
    end

  def haversine(lat1, lng1, lat2, lng2)
    dtor = Math::PI/180
    radius_miles = 3959

    rlat1 = lat1 * dtor
    rlng1 = lng1 * dtor
    rlat2 = lat2 * dtor
    rlng2 = lng2 * dtor

    dlng = rlng1 - rlng2
    dlat = rlat1 - rlat2

    a = (Math::sin(dlat / 2) ** 2) + Math::cos(rlat1) * Math::cos(rlat2) * (Math::sin(dlng / 2) ** 2)
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))
    d = radius_miles * c

    return d
  end

end
