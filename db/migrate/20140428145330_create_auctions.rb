class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.references :user
      t.references :category
      t.string :location
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end