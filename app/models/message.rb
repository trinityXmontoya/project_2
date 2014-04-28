class Message < ActiveRecord::Base
  belongs_to :auction
  belongs_to :bid
  has_one :user

  validates :content, :user_id, presence: true

end
