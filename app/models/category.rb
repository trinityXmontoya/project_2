class Category < ActiveRecord::Base
  has_many :auctions

  def self.retrieve_user_badges(user_badges)
     badges = []
     user_badges.each do |badge|
      badges << Category.find(badge)
    end
    return badges
  end
end



