class User < ActiveRecord::Base

  # used for setting custom primary key instead of index
  self.primary_key = :id

  has_many :bids, dependent: :destroy
  has_many :auctions, dependent: :destroy

  has_many :messages, through: :bids
  has_many :messages, through: :auctions
  has_many :messages, foreign_key: 'sender_id'

  has_many :categories, through: :auctions
  has_many :categories, through: :bids

  belongs_to :auction_participants

# facebook login
  def self.facebook_auth(auth)
    where(auth.slice(:provider, :id)).first_or_initialize.tap do |user|
      user.id = auth.uid
      user.oauth_token = auth.credentials.token
      user.oauth_token_expires_at = auth.credentials.expires_at
      user.email = auth.info.email
      user.name = auth.info.first_name
      user.profile_photo = auth.info.image
      user.city = auth.info.location
      user.save!
    end
  end

  def find_bidders
    bid_ids=[]
    bidders=[]
    self.auctions.where('completed=? OR completed=?', nil,false).each do |auction|
      auction.bids.each do |bid|
        bid_ids << bid.user_id
      end
      return bid_ids
    end
    bid_ids.each do |bid_id|
      bidders << User.find(bid_id)
    end
    return bidders
  end


end
