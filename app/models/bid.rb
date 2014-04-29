class Bid < ActiveRecord::Base

belongs_to :user
belongs_to :auction

has_many :categories

end
