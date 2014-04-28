class User < ActiveRecord::Base
  has_many :bids, dependent: :destroy
  has_many :auctions, dependent: :destroy

  has_many :messages, through: :bids
  has_many :messages, through: :auctions

  has_many :categories, through: :auctions
  has_many :categories, through: :bids
end


# Message.new(user_id: @bid.user_id , messager_id: )
#
# @message.bid.user
# @message.auction.user


# Way 1


  def time_left(time)
    return false unless time
    if time == 0 || time.now - time_left < 0
      return false
    else
      self.time.now = self.time.now - time_left
      return self.save
    end
  end
