Auction.create(id: 4, user_id: 54365808, category_id: 1, location: 'New York City', title: 'Looking for thick rimmed glasses Hipsters for a good time', description:'I am looking for some hot Hipster guys who are not sexist and who want to have a good time', time_limit:'', completed: true)
Auction.create(id:2, user_id: 54369676, category_id:1 , location: 'Greenwich', title: 'Lets go rockclimbing or mountain biking Brah!', description:'I want to go do some hardcore rockclimbing or mountain biking, and maybe some crossfit', time_limit:'', completed: false)
Auction.create(id: 1, user_id: 54364643, category_id: 2, location: 'Brooklyn', title: 'New to This Online Dating Thing (Swear its my first time)', description:'This is my first time using this app, I swear, but Im looking to go on a nice date', time_limit:'', completed: true)
Auction.create(id: 3, user_id: 54364657, category_id: 2, location: 'Brooklyn', title: 'I Should Write a nice Title but I am full of myself', description:'I should write a nice title but I am full of myself and think Im better than you', time_limit:'', completed: false)
Auction.create(id: 5, user_id: 54360893, category_id: 3, location: 'Queens', title: 'Fuck with my Hat On', description:'I want to fuck with my hat on', time_limit:'', completed: true)


Category.create(id: 1, title: 'Adventure', description: 'Explore together!', badge_photo: 'http://m.c.lnkd.licdn.com/mpr/pub/image-OPaKMvn7tBkfxi01Ef3vup2nN2leeSlKX4aB_NQwN8N6owK6OPaBp217NUMe...')
Category.create(id: 2, title: 'Date', description: 'Have a romantic evening out', badge_photo: 'http://files.list.co.uk/images/2011/08/22/some-small-love-story-23506.jpg')
Category.create(id: 3, title: 'Casual Encounter', description: 'Dispense with the Pleasantries', badge_photo: 'http://millerexpress.ca/wp-content/uploads/2014/01/casual-encounter.jpg')


Bid.create(user_id: 54365808, auction_id: '1', comment: 'I would love to take you out baby', viewed: true)
Bid.create(user_id: 54364643, auction_id: '5', comment: 'I want to do this with you so badly', viewed: false)
