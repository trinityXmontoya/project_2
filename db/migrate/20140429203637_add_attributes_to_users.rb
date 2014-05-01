class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :oauth_token_expires_at, :integer
    add_column :users, :zip_code, :integer

    rename_column :users, :location, :city
  end
end
