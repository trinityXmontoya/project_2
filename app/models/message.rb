class Message < ActiveRecord::Base

  #allows the use of route helpers
  include Rails.application.routes.url_helpers


  belongs_to :sender, class_name: "User", foreign_key: 'sender_id'
  belongs_to :receiver, class_name: "User", foreign_key: 'receiver_id'

  validates :sender_id, :receiver_id, :auction_id, :content, presence: true

  def mark_as_viewed
    self.update(viewed: true)
  end

  def archive
    self.update(archived: true)
  end

  #admin login requires simple email login, not facebook

  def self.badge_acceptance(auction)
    participants = AuctionParticipant.find_participants(auction)
    badge_acceptance_link = link_to("#{auction.category.name} badge", auction_accept_badge_path(auction), remote: true)
    participants.each { |participant|
      self.create(sender_id: 000000, receiver_id: participant.id,
    content: "Head on over to accept your #{badge_acceptance_link}")
    }
  end

  def self.auction_user(auction, user)
    auction_link = link_to(auction.name,auctions_path(auction))
    self.create(sender_id: 000000, receiver_id: user.id,
    content: "Congratulations #{user.name}! Your auction: #{auction_link} is over. Check it out!")
  end

  def self.auction_winner(auction, user)
    auction_link = link_to(auction.name,auctions_path(auction))
    user_link = link_to(user.name,users_path(user))
    self.create(sender_id: 000000, receiver_id: user.id,
    content: "Congratulations #{user.name}! You won auction: #{auction_link} by #{user_link}.")
  end

  def self.auction_loser(auction, user)
    auction_link = link_to(auction.name,auctions_path(auction))
    user_link = link_to(user.name,users_path(user))
    all_auctions_link = link_to("all our auctions",auctions_path)
    self.create(sender_id: 000000, receiver_id: user.id,
    content: "Sorry #{user.name}! You did not win: #{auction_link}. Check out #{}.")
  end


end
