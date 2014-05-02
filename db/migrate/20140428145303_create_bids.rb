class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :user
      t.references :auction
      t.string :comment
      t.boolean :viewed, default: false
      t.boolean :won, default: false
      t.boolean :archived, default: false
      t.timestamps
    end
  end
end
