class CreateAuctionParticipants < ActiveRecord::Migration
  def change
    create_table :auction_participants do |t|
      t.references :auction, index: true
      t.references :user, index: true
      t.boolean :completed, default: false
    end
  end
end
