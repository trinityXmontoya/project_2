class Message < ActiveRecord::Base
  belongs_to :auction
  belongs_to :bid

  has_one :user, through: :auction
  has_one :user, through: :bid

end
