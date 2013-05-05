# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SetlistType.create([
  
])

Band.create([
  { name: 'Pfisters' },
  { name: 'Robot Death Kites' },
  { name: 'In Rod' }
])

p = Band.find_by_name('Pfisters')
p.songs.create( { title: 'Princess Bride', tuning: 'E', duration: 0 } )

r = Band.find_by_name('Robot Death Kites')
r.songs.create([
  { title: 'Yuppie Nightmare', tuning: 'E', duration: 0 },
  { title: 'A.D.D.', tuning: 'E', duration: 0 },
  { title: 'Free Speech Zone', tuning: 'E', duration: 0 },
  { title: 'Facebook Whore', tuning: 'E', duration: 0 },
  { title: 'Happy Face', tuning: 'E', duration: 0 },
  { title: 'No Thanks', tuning: 'E', duration: 0 },
  { title: 'Quickie', tuning: 'E', duration: 0 },
  { title: 'Fight or Flight', tuning: 'E', duration: 0 },
  { title: 'Corporate Brown Shirts', tuning: 'E', duration: 0 }
])

i = Band.find_by_name('In Rod')
i.songs.create( { title: 'Purpose', tuning: 'E', duration: 0 } )

Band.all.each{ |b| puts "#{b.name} created with #{b.songs.count} songs!"}