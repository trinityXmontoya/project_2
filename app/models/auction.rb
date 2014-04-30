class Auction < ActiveRecord::Base
    has_many :categories, :through => :categorizations
    accepts_nested_attributes_for :categorizations
    has_many :bids
    has_many :messages
    belongs_to :user
    belongs_to :auction_participants
  end


  def self.search_for(query)
    # self.where('')
    # self.latitude
    # self.longitude
  end

  # self.where('name LIKE :query OR description LIKE :query OR year_release LIKE :query', query: "%#{query}%")

  def get_location(address)
    address = address.downcase.gsub(" ", "+")
    latlng = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=true&key=#{ENV['GOOGLE_GEOCODING_KEY']}")['results'][0]['geometry']['location']
  end

  def save_location(latlng)
    self.latitude = latlng['lat']
    self.longitude = latlng['lng']
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

    def add_end_time(date)
      self.update(time_end: date.now.change({hour: 21}))
    end

    def end_auction
        notify_participants
        mark_notifications_sent
        archive_bids
        close_messaging
    end

    def notify_participants
      #notify the auction creator
      AuctionParticipant.create(auction: self, user: self.user)
      message_user

      bids.each do |bid|
        if bid.won
          #notify winners of the auction
          AuctionParticipant.create(auction: self, user: bid.user)
          message_winner(bid.user)
        else
          #notify losers of the auction
          message_loser(bid.user)
        end
      end
    end

    def message_user
      Message.auction_user(self,user)
    end

    def message_winner(bid)
      Message.auction_winner(self,bid.user)
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

    def calculate_accepted_bids
      accepted_bids = []
          bids.each do |bid|
               accepted_bids.select { |bid| bid.won == true}
          end
          if accepted_bids.length == self.num_of_req_bids
              self.time_end = Time.now
              self.end_auction
          end
    end


end
