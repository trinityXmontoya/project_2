class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :user
      t.references :auction
      t.string :comment
      t.boolean :viewed
      t.boolean :won
      t.boolean :archived
      t.timestamps
    end
  end
end
