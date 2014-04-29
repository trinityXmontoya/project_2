class User < ActiveRecord::Base
  # used for setting custom primary key instead of index
  self.primary_key = :id

  has_many :bids, dependent: :destroy
  has_many :auctions, dependent: :destroy

  has_many :messages, through: :bids
  has_many :messages, through: :auctions
<<<<<<< HEAD
<<<<<<< HEAD
  has_secure_password

  validates(:email, uniqueness: true, presence: true)
  validates(:name, presence: true)
  validates(:password, length: { minimum: 5 })
=======

  has_many :categories, through: :auctions
  has_many :categories, through: :bids
>>>>>>> 9b32de2c71e8d3bc2fec99cbf3e288449c298fa6
=======

  has_many :categories, through: :auctions
  has_many :categories, through: :bids

# facebook login
  def self.facebook_auth(auth)
    where(auth.slice(:provider, :id)).first_or_initialize.tap do |user|
      user.id = auth.uid
      user.oauth_token = auth.credentials.token
      # FIXME may need oauth expires at column, don't remember how strict facebook is with this
      user.name = auth.info.first_name
      user.profile_photo = auth.info.image
      user.location = auth.info.location
      user.save!
    end
  end

>>>>>>> 41846627a73503e846be951c1913e8d1da5e721c
end


# Message.new(user_id: @bid.user_id , messager_id: )
#
# @message.bid.user
# @message.auction.user
