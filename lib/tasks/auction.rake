task end_auction: :environment do
  desc "End auction and perform associated tasks"
  auctions = Auction.where(completed: true, notifications_sent: false)
  auctions.each {|auction| auction.end_auction}
end

