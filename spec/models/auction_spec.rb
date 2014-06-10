require 'spec_helper'

describe Auction do
  before :each do
    Auction.create(id: 201, latitude: 40.65 , event_date: '2014-04-28', longitude: -73.95 , user_id: 1, category_id: 61, title: 'Lets go rockclimbing or mountain biking Brah!', description:'I want to go do some hardcore rockclimbing or mountain biking, and maybe some crossfit', time_begin:'2014-02-27', time_end:'2014-03-02', completed: false, num_of_req_bids: 10, address:'145 ImRich Lane', website:'http://www.rich.com', img_url:'http://216.218.248.240/datastore/21/59/b/2159267dabd1c5339232053779d0c143.jpg', notifications_sent: false)
  end

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :category_id }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :time_begin }
  it { should validate_presence_of :time_end }
  it { should validate_presence_of :event_date }
  it { should validate_presence_of :completed }
  it { should validate_presence_of :num_of_req_bids }
  it { should validate_presence_of :address }
  it { should validate_presence_of :latitude }
  it { should validate_presence_of :longitude }
  it { should validate_presence_of :website }
  it { should validate_presence_of :img_url }
end
