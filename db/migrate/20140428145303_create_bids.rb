class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :user
      t.references :auction
      t.string :comment
      t.boolean :viewed
      t.boolean :won
      t.timestamps
    end
  end
end
