class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.references :user
      t.references :category
      t.string :location
      t.string :title
      t.text :description
      t.datetime :time_limit
      t.boolean :completed
      t.integer :num_of_winners
      t.string :address
      t.string :website
      t.string :img_url
      t.timestamps
    end
  end
end
