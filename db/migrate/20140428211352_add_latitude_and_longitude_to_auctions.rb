class AddLatitudeAndLongitudeToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :latitude, :float
    add_column :auctions, :longitude, :float
  end
end
