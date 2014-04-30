class Category < ActiveRecord::Base
  belongs_to :auction
  has_many :categorizations,
  has_many :auctions, :through => :categorizations

  validates :name, :presence => true
end
