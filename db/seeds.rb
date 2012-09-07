# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new

u.name = "mimic"
u.email = "dopi0310@gmail.com"
u.password = Devise.friendly_token[0,20]
u.fb_id = "100004170064639"
u.token = "AAAHAZB7d17ZCYBAAF9SeqhCBTVUYUZBm76fNRrDOVT1LdZAxAA2Epx5NesXODnUmVZA4fjIWgsqZB7xYOFP6CrXaAtVI8cAN2kMKQpDstGWwZDZD"
u.save

puts "create dopi"