require 'spec_helper'

describe Bid do
  before :each do
    Auction.create(id: 201, latitude: 40.65 , event_date: '2014-04-28', longitude: -73.95 , user_id: 1, category_id: 61, title: 'Lets go rockclimbing or mountain biking Brah!', description:'I want to go do some hardcore rockclimbing or mountain biking, and maybe some crossfit', time_begin:'2014-02-27', time_end:'2014-03-02', completed: false, num_of_req_bids: 10, address:'145 ImRich Lane', website:'http://www.rich.com', img_url:'http://216.218.248.240/datastore/21/59/b/2159267dabd1c5339232053779d0c143.jpg', notifications_sent: false)
    # check these
    Bid.create(user_id: 516276458, auction_id: 203, comment: 'Ooh la la', viewed: false, won: true)
    Message.create(id:1 , sender_id: 516276458, receiver_id:0000 , content: "What's up joe?" )
    Message.create(id:2 , sender_id: 516276458, receiver_id: 0000 , content: "What's up jammer?" )
    Message.create(id:3 , sender_id: 0000 , receiver_id: 516276458, content: "How are you" )
    Message.create(id:4 , sender_id: 0000 , receiver_id: 516276458, content: "I'd love to meet you!" )
    Category.create(id: 300, title: 'Food and Drinks', description: 'Explore together!', badge_photo: 'http://i.imgur.com/vHssjM1.png')

  end

end
