class Message < ActiveRecord::Base

  #allows the use of route helpers
  include Rails.application.routes.url_helpers


  belongs_to :sender, class_name: "User", foreign_key: 'sender_id'
  belongs_to :receiver, class_name: "User",foreign_key: 'reciever_id'


  def mark_as_viewed
    self.update(viewed: true)
  end

  def self.auction_user(auction, user)
    auction_link = link_to(auction.name,auctions_path(auction))
    Message.create(sender_id: 000000, receiver_id: user.id,
    content: "Congratulations #{user.name}! Your auction: #{auction_link} is over. Check it out!")
  end

  def self.auction_winner(auction, user)
    auction_link = link_to(auction.name,auctions_path(auction))
    user_link = link_to(user.name,users_path(user))
    Message.create(sender_id: 000000, receiver_id: user.id,
    content: "Congratulations #{user.name}! You won auction: #{auction_link} by #{user_link}.")
  end

  def self.auction_loser(auction, user)
    auction_link = link_to(auction.name,auctions_path(auction))
    user_link = link_to(user.name,users_path(user))
    Message.create(sender_id: 000000, receiver_id: user.id,
    content: "Sorry #{user.name}! You did not win: #{auction_link} by #{user_link}. ")
  end


end
