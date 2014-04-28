class User < ActiveRecord::Base
  self.primary_key = :id

  has_many :bids, dependent: :destroy
  has_many :auctions, dependent: :destroy

  has_many :messages, through: :bids
  has_many :messages, through: :auctions

  has_many :categories, through: :auctions
  has_many :categories, through: :bids

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

end


# Message.new(user_id: @bid.user_id , messager_id: )
#
# @message.bid.user
# @message.auction.user
