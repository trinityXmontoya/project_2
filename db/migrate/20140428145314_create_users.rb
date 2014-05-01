class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: false do |t|
      t.string :id
      t.string :oauth_token
      t.string :name
      t.string :profile_photo
      t.string :location
      t.string :bio
      t.string :badges, array: true, default: []
      t.timestamps
    end
    add_index :users, :id, unique: true
  end
end
