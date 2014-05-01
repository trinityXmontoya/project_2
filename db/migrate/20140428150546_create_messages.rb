class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id, limit: 8
      t.integer :receiver_id, limit: 8
      t.references :auction
      t.text :content
      t.boolean :viewed
      t.boolean :archived
      t.timestamps
    end
  end
end
