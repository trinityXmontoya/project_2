class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id, limit: 8
      t.integer :receiver_id, limit: 8
      t.references :auction, default: false
      t.text :content
      t.boolean :viewed, default: false
      t.boolean :archived, default: false
      t.timestamps
    end
  end
end
