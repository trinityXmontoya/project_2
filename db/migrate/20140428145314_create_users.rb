class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: false do |t|
      t.integer :id
      t.string :oauth_token
      t.string :name
      t.string :profile_photo
      t.string :location
      t.string :bio
      t.timestamps
    end
  end
end
