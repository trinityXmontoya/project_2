class Category < ActiveRecord::Base
  belongs_to :auction
<<<<<<< HEAD
  has_many :categorizations,
  has_many :auctions, :through => :categorizations

  validates :name, :presence => true
=======


  def self.retrieve_user_badges(user_badges)
     badges = []
     user_badges.each do |badge|
      badges << Category.find(id: badge)
    end
    return badges
  end


>>>>>>> 59576171e9e1da99a71997f48239b7e31eadcaa1
end


