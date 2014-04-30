class Auction < ActiveRecord::Base
  geocoded_by :address
  # after_validation :geocode, :if => :address_changed?

  has_many :categories
  has_many :bids
  has_many :messages
  belongs_to :user
  belongs_to :auction_participants

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

    def message_user(bid)
      Message.auction_user(self,bid.user)
    end

    def message_winner
      Message.auction_winner(self,user)
    end

    def message_loser(bid)
      Message.auction_loser(self,bid.user)
    end

    def end_bidding
      bids.each do |bid|
        bid.archive_bid
      end
    end

    def close_messaging
    end

  end
