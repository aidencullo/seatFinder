# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Company.destroy_all
Customer.destroy_all
Venue.destroy_all
Event.destroy_all
Ticket.destroy_all

Company.create
Customer.create
Venue.create
Event.create(venue_id:1, company_id:1)
Event.create(venue_id:1, company_id:1)
Event.create(venue_id:1, company_id:1)
Ticket.create(event_id:1, customer_id:1)
