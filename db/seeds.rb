# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bob = User.find_by_id(2)
linda = User.find_by_id(3)
scooby = User.find_by_id(4)

amazon = ShortenedUrl.find_by_id(2)
bob_dirty = ShortenedUrl.find_by_id(3)
bob_nice = ShortenedUrl.find_by_id(4)
scooby_site = ShortenedUrl.find_by_id(5)

Visit.record_visit!(bob, bob_dirty)
Visit.record_visit!(bob, bob_nice)
Visit.record_visit!(linda, amazon)
Visit.record_visit!(linda, scooby_site)
Visit.record_visit!(linda, bob_dirty)
Visit.record_visit!(scooby, scooby_site)

Visit.record_visit!(bob, bob_dirty)
Visit.record_visit!(bob, bob_dirty)
