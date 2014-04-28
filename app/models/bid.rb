class Bid < ActiveRecord::Base
belongs_to :user, through: :auction

end
