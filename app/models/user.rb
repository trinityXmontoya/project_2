class User < ActiveRecord::Base
  has_many :bids, dependent: :destroy
  has_many :auctions, dependent: :destroy

  has_many :messages, through: :bids
  has_many :messages, through: :auctions
<<<<<<< HEAD
  has_secure_password

  validates(:email, uniqueness: true, presence: true)
  validates(:name, presence: true)
  validates(:password, length: { minimum: 5 })
=======

  has_many :categories, through: :auctions
  has_many :categories, through: :bids
>>>>>>> 9b32de2c71e8d3bc2fec99cbf3e288449c298fa6
end


# Message.new(user_id: @bid.user_id , messager_id: )
#
# @message.bid.user
# @message.auction.user
