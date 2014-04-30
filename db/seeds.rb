# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Auction.create(id: 4, user_id: 100008291315808, category_id: 3, location: 'New York City', title: 'Looking for thick rimmed glasses Hipsters for a good time', description:'I am looking for some hot Hipster guys who are not sexist and who want to have a good time', time_begin:'2014-04-28', time_end:'2014-04-30' completed: true, num_of_req_bids: 1, address:'123 Hipster Restaurant', website:'http://www.hipster.com', img_url:'http://216.218.248.240/datastore/02/24/b/022492ec68f4005e34daf54e55082ffd.jpg', t.boolean: true)
Auction.create(id: 2, user_id: 100008280519676, category_id: 2, location: 'Greenwich', title: 'Lets go rockclimbing or mountain biking Brah!', description:'I want to go do some hardcore rockclimbing or mountain biking, and maybe some crossfit', time_begin:'2014-02-27', time_end:'2014-03-02', completed: false, num_of_req_bids: 10, address:'145 ImRich Lane', website:'http://www.rich.com', img_url:'http://216.218.248.240/datastore/21/59/b/2159267dabd1c5339232053779d0c143.jpg', notifications_sent: false)
Auction.create(id: 1, user_id: 100008317954643, category_id: 1, location: 'Brooklyn', title: 'New to This Online Dating Thing (Swear its my first time)', description:'This is my first time using this app, I swear, but Im looking to go on a nice date', time_begin:'2014-01-23', time_end:'2014-01-27', completed: true, num_of_req_bids: 2, address:'124 Firsttime Lane', website:'http://www.first.com', img_url:'http://216.218.248.240/datastore/21/59/b/2159267dabd1c5339232053779d0c143.jpg', notifications_sent: true)
Auction.create(id: 3, user_id: 100008313814657, category_id: 1, location: 'Brooklyn', title: 'I Should Write a nice Title but I am full of myself', description:'I should write a nice title but I am full of myself and think Im better than you', time_begin:'2014-05-16', time_end:'2014-05-17', completed: false, num_of_req_bids: 3, address:'435 Narcissist Street', website:'http://www.narcissist.com', img_url:'http://216.218.248.240/datastore/21/59/b/2159267dabd1c5339232053779d0c143.jpg', notifications_sent: false)
Auction.create(id: 5, user_id: 100008231200893, category_id: 2, location: 'Queens', title: 'Fuck with my Hat On', description:'I want to fuck with my hat on', time_begin:'2014-05-07', time_end:'2014-05-09', completed: true, num_of_req_bids: 8, address:'53 Hat Court', website:'http://www.hat.com', img_url: 'http://216.218.248.240/datastore/21/59/b/2159267dabd1c5339232053779d0c143.jpg', notifications_sent: true)


Category.create(id: 1, title: 'Food and Drinks', description: 'Explore together!', badge_photo: 'http://m.c.lnkd.licdn.com/mpr/pub/image-OPaKMvn7tBkfxi01Ef3vup2nN2leeSlKX4aB_NQwN8N6owK6OPaBp217NUMeelCVWDR1/trinity-montoya.jpg')
Category.create(id: 2, title: 'Date', description: 'Have a romantic evening out', badge_photo: 'http://files.list.co.uk/images/2011/08/22/some-small-love-story-23506.jpg')
Category.create(id: 3, title: 'Coffee', description: 'Dispense with the Pleasantries', badge_photo: 'http://millerexpress.ca/wp-content/uploads/2014/01/casual-encounter.jpg')
Category.create(id: 4, title: 'Culture', description: 'CULTURE!', badge_photo: 'http://m.c.lnkd.licdn.com/mpr/pub/image-OPaKMvn7tBkfxi01Ef3vup2nN2leeSlKX4aB_NQwN8N6owK6OPaBp217NUMeelCVWDR1/trinity-montoya.jpg')
Category.create(id: 5, title: 'Sights', description: 'Lets see some sights, how beautiful', badge_photo: 'http://files.list.co.uk/images/2011/08/22/some-small-love-story-23506.jpg')
Category.create(id: 6, title: 'Outdoors', description: 'What a beautiful day out', badge_photo: 'http://millerexpress.ca/wp-content/uploads/2014/01/casual-encounter.jpg')
Category.create(id: 7, title: 'Adventure', description: 'Explore together!', badge_photo: 'http://m.c.lnkd.licdn.com/mpr/pub/image-OPaKMvn7tBkfxi01Ef3vup2nN2leeSlKX4aB_NQwN8N6owK6OPaBp217NUMeelCVWDR1/trinity-montoya.jpg')
Category.create(id: 8, title: 'Arts and Culture', description: 'I am so cultured', badge_photo: 'http://files.list.co.uk/images/2011/08/22/some-small-love-story-23506.jpg')
Category.create(id: 9, title: 'Dancing', description: 'Lets go dancing merengue', badge_photo: 'http://millerexpress.ca/wp-content/uploads/2014/01/casual-encounter.jpg')
Category.create(id: 10, title: 'Music', description: 'Lets jam together brah!', badge_photo: 'http://m.c.lnkd.licdn.com/mpr/pub/image-OPaKMvn7tBkfxi01Ef3vup2nN2leeSlKX4aB_NQwN8N6owK6OPaBp217NUMeelCVWDR1/trinity-montoya.jpg')
Category.create(id: 11, title: 'Spirituality', description: 'Peace and Love', badge_photo: 'http://files.list.co.uk/images/2011/08/22/some-small-love-story-23506.jpg')
Category.create(id: 12, title: 'Tech', description: 'Changing society for the better', badge_photo: 'http://millerexpress.ca/wp-content/uploads/2014/01/casual-encounter.jpg')
Category.create(id: 13, title: 'Sports and Recreation', description: 'Lets play some football bru!', badge_photo: 'http://m.c.lnkd.licdn.com/mpr/pub/image-OPaKMvn7tBkfxi01Ef3vup2nN2leeSlKX4aB_NQwN8N6owK6OPaBp217NUMeelCVWDR1/trinity-montoya.jpg')
Category.create(id: 14, title: 'Fashion and Beauty', description: 'You look beautiful', badge_photo: 'http://files.list.co.uk/images/2011/08/22/some-small-love-story-23506.jpg')
Category.create(id: 15, title: 'Education and Learning', description: 'I have been learning so much', badge_photo: 'http://millerexpress.ca/wp-content/uploads/2014/01/casual-encounter.jpg')
Category.create(id: 16, title: 'Health and Wellbeing', description: 'Healthy Living', badge_photo: 'http://m.c.lnkd.licdn.com/mpr/pub/image-OPaKMvn7tBkfxi01Ef3vup2nN2leeSlKX4aB_NQwN8N6owK6OPaBp217NUMeelCVWDR1/trinity-montoya.jpg')
Category.create(id: 17, title: 'Pets and Animals', description: 'Rate my kitten.com', badge_photo: 'http://files.list.co.uk/images/2011/08/22/some-small-love-story-23506.jpg')
Category.create(id: 18, title: 'Movies and Film', description: 'Lets checkout some films', badge_photo: 'http://millerexpress.ca/wp-content/uploads/2014/01/casual-encounter.jpg')
Category.create(id: 19, title: 'Movements and Politics', description: 'Mitt Romney is the devil, ZEITGEIST', badge_photo: 'http://m.c.lnkd.licdn.com/mpr/pub/image-OPaKMvn7tBkfxi01Ef3vup2nN2leeSlKX4aB_NQwN8N6owK6OPaBp217NUMeelCVWDR1/trinity-montoya.jpg')
Category.create(id: 20, title: 'Fitness', description: 'I want to go running, will you join me?', badge_photo: 'http://files.list.co.uk/images/2011/08/22/some-small-love-story-23506.jpg')
Category.create(id: 21, title: 'Hobbies and Crafts', description: 'Hobbies are so cool', badge_photo: 'http://millerexpress.ca/wp-content/uploads/2014/01/casual-encounter.jpg')
Category.create(id: 22, title: 'Community and Environment', description: 'Lets cleanup the creek', badge_photo: 'http://m.c.lnkd.licdn.com/mpr/pub/image-OPaKMvn7tBkfxi01Ef3vup2nN2leeSlKX4aB_NQwN8N6owK6OPaBp217NUMeelCVWDR1/trinity-montoya.jpg')

Bid.create(user_id: 100008291315808, auction_id: 1, comment: 'I would love to take you out baby', viewed: true)
Bid.create(user_id: 100008317954643, auction_id: 5, comment: 'I want to do this with you so badly', viewed: false)
