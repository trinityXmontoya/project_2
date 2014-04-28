class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :bid
      t.references :auction
      t.text :message
      t.timestamps
    end
  end
end
