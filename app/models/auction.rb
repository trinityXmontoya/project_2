class Auction < ActiveRecord::Base

  has_many :categories
  has_many :bids
  has_many :messages
  belongs_to :user
  belongs_to :auction_participants

  def get_location(address)
    escaped_address = address.downcase.gsub(  " ", "+")
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
