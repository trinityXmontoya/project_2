class RemoveIdFromUsers < ActiveRecord::Migration
  def change
    drop_table :users

    create_table :users do |t|
      t.string :uid
      t.string :oauth_token
      t.integer :oauth_token_expires_at
      t.string :name
      t.string :profile_photo
      t.string :city
      t.string :bio
      t.string :badges, array: true, default: []
      t.string :provider
      t.string :email
      t.integer :zip_code

      t.timestamps
    end
  end
end
