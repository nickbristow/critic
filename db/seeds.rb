# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

games = Game.create([{title: 'Halo 1', description: 'A game on a ring', boxart: 'box.jpg', releasedate: '12/12/1912'}, 
                     {title:'Borderlands', description: 'A game with lots of loot', boxart: 'box.jpg', releasedate: '12/12/1912' },
                     {title:'Bloodborne', description: 'A game with description', boxart: 'box.jpg', releasedate: '12/12/1912' },
                     {title:'Shadows of Mordor', description: 'A game with description', boxart: 'box.jpg', releasedate: '12/12/1912' },
                     {title:'Battlefield 4', description: 'A game with description', boxart: 'box.jpg', releasedate: '12/12/1912' },])

editors = Editor.create([{name: 'Nick Bristow', outlet: 'Geekly Inc', bio: 'My bio is here for you to read', image:'image.jpg'},
                         {name: 'Dave Hinkle', outlet: 'Joystiq', bio: 'My bio is here for you to read', image:'image.jpg'},
                         {name: 'Alexander Sliwinski', outlet: 'Joystiq', bio: 'My bio is here for you to read', image:'image.jpg'},
                         {name: 'Justin McElroy', outlet: 'Polygon', bio: 'My bio is here for you to read', image:'image.jpg'},
                         {name: 'Griffin McElroy', outlet: 'Polygon', bio: 'My bio is here for you to read', image:'image.jpg'},])
Console.create([{name: 'Xbox One'},
                           {name:'Xbox', abbr: 'Xbox'},
                           {name: 'Xbox 360', abbr: '360'},
                           {name: 'Playstation', abbr: 'PS1'},
                           {name: 'Playstation 2', abbr: 'ps2'},
                           {name: 'Playstation 3', abbr: 'ps3'},
                           {name: 'Playstation 4', abbr: 'ps4'},
                           {name: 'Wii', abbr: 'Wii'},
                           {name: 'Wii U', abbr:'Wii U'}])

games.each do |g|
  num_reviews = (rand * 10 + 1).to_i
  c = Console.all
  g.consoles << Console.all[(rand * 9).to_i]
  g.consoles << Console.all[(rand * 9).to_i]

  num_reviews.times do 
    g.reviews.create({score: ((rand*100)+1).to_i, link: "https://www.google.com", editor_id: ((rand*5)+1).to_i })
  end
  g.save
end