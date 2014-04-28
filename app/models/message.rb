class Message < ActiveRecord::Base
  belongs_to :auction
  belongs_to :bid
end
