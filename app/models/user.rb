class User < ActiveRecord::Base
  has_many :bids
  has_many :auctions
  has_many :messages, through: :bids
  has_many :messages, through: :auctions
  has_secure_password

  validates(:email, uniqueness: true, presence: true)
  validates(:name, presence: true)
  validates(:password, length: { minimum: 5 })
end
