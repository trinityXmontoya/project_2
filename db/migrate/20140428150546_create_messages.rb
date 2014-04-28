class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: "sender_id"
      t.references :user, foreign_key: "receiver_id" 
      t.text :message
      t.boolean :viewed
      t.timestamps
    end
  end
end
