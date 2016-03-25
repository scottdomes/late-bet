
require 'factory_girl'
FactoryGirl.find_definitions

FactoryGirl.create :user

maz = User.create(
  first_name: Maz, 
  last_name: Ahmadi, 
  user_name: mazzzz, 
  image_file_name: '/img/maz.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: maz.id, 
  title: "finish Lighthouse Labs!", 
  deadline: "2016/04/28 18:00",
  stake_item: "Macbook Pro",
  stake_qty: 1
  )

jess = User.create(
  first_name: Jessica, 
  last_name: Peters, 
  user_name: jess, 
  image_file_name: '/img/jess.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: jess.id, 
  title: "eat lunch and supper!", 
  deadline: "2016/03/29 23:00",
  stake_item: "fancy expensive Prado coffee",
  stake_qty: 1
  )

lenny = User.create(
  first_name: Lenox, 
  last_name: Jung, 
  user_name: lenny, 
  image_file_name: '/img/lenox.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: lenny.id, 
  title: "actually do his readings.", 
  deadline: "2016/04/01 18:00",
  stake_item: "bottle of Jones",
  stake_qty: 1
  )

kevin = User.create(
  first_name: Kevin, 
  last_name: Hung, 
  user_name: kevin, 
  image_file_name: '/img/kevin.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: kevin.id, 
  title: "finish Lighthouse Labs!", 
  deadline: "2016/04/28 18:00",
  stake_item: "$50 Starbucks gift card",
  stake_qty: 1
  )

nina = User.create(
  first_name: Nina, 
  last_name: Winkler, 
  user_name: nina, 
  image_file_name: '/img/nina.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: nina.id, 
  title: "get a dev job.", 
  deadline: "2016/06/01 12:00",
  stake_item: "apartment (a nice one!)",
  stake_qty: 1
  )

james = User.create(
  first_name: James, 
  last_name: McKeen, 
  user_name: james, 
  image_file_name: '/img/james.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: james.id, 
  title: "eat something.", 
  deadline: "2016/03/28 23:00",
  stake_item: "bottle of a Pepto Bismol",
  stake_qty: 1
  )


david = User.create(
  first_name: David, 
  last_name: Van Dusen, 
  user_name: david, 
  image_file_name: '/img/david.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: david.id, 
  title: "learn a piece on cello.", 
  deadline: "2016/03/28 23:00",
  stake_item: "picture of himself.",
  stake_qty: 1
  )

alvin = User.create(
  first_name: Alvin, 
  last_name: Chen, 
  user_name: alvin, 
  image_file_name: '/img/alvin.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: alvin.id, 
  title: "go to the gym four times a week.", 
  deadline: "2016/06/01 12:00",
  stake_item: "coffees.",
  stake_qty: 2
  )

justine = User.create(
  first_name: Justine, 
  last_name: Herman, 
  user_name: justine, 
  image_file_name: '/img/justine.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: justine.id, 
  title: "kick ass in today's presentation.", 
  deadline: "2016/03/28 9:00",
  stake_item: "granola bars.",
  stake_qty: 2
  )

osama = User.create(
  first_name: Osama, 
  last_name: Khan, 
  user_name: osama, 
  image_file_name: '/img/osama.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: osama.id, 
  title: "finish the project!", 
  deadline: "2016/03/28 9:00",
  stake_item: "hours of coding.",
  stake_qty: 3
  )

chris = User.create(
  first_name: Chris, 
  last_name: Milbourne, 
  user_name: chris, 
  image_file_name: '/img/chris.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: chris.id, 
  title: "figure out the Google API.", 
  deadline: "2016/03/28 9:00",
  stake_item: "lawn mowning.",
  stake_qty: 1
  )

paul = User.create(
  first_name: Paul, 
  last_name: Save, 
  user_name: paul, 
  image_file_name: '/img/paul.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: paul.id, 
  title: "not cause any Git conflicts.", 
  deadline: "2016/03/28 9:00",
  stake_item: "Cheeto.",
  stake_qty: 1
  )

julia = User.create(
  first_name: Julia, 
  last_name: Wei, 
  user_name: jules, 
  image_file_name: '/img/julia.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: julia.id, 
  title: "bike the seawall.", 
  deadline: "2016/04/04 9:00",
  stake_item: "beers.",
  stake_qty: 2
  )

scott = User.create(
  first_name: Scott, 
  last_name: Domes, 
  user_name: scott, 
  image_file_name: '/img/scott.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: scott.id, 
  title: "beat Paul in foosball.", 
  deadline: "2016/04/01 9:00",
  stake_item: "beer.",
  stake_qty: 1
  )

filip = User.create(
  first_name: Filip, 
  last_name: Juristovski, 
  user_name: scott, 
  image_file_name: '/img/filip.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: filip.id, 
  title: "not suck every day.", 
  deadline: "2016/04/08 9:00",
  stake_item: "night of sweet lovin'.",
  stake_qty: 1
  )

alex = User.create(
  first_name: Alex, 
  last_name: Lindsay, 
  user_name: alex, 
  image_file_name: '/img/alex.jpg',
  email: "blank@blank.com"
  )
Goal.create(
  user_id: alex.id, 
  title: "make an MVP of MoleBot.", 
  deadline: "2016/06/01 9:00",
  stake_item: "week's supply of lip balm.",
  stake_qty: 1
  )