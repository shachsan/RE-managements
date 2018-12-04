# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Agent.create(name: "Sanjay")

Agent.create(name: "Terrance")

Building.create(name: "access labs", address: "81 Prospect, Brooklyn, NY")

Lease.create!(start_date: DateTime.new(2018,12,3), exp_date: DateTime.new(2019,12,3), tenant_name: "Carlo")

Lease.create!(start_date: DateTime.new(2018,12,6), exp_date: DateTime.new(2020,12,6), tenant_name: "Rob")

Apartment.create(unit_no: "4A", size: 1000, bedrooms: 2, rent: 1500.50, electricity: false, water: true, gas: true, lease_id: 1, building_id: 1, agent_id: 1)

Apartment.create(unit_no: "7C", size: 1000, bedrooms: 3, rent: 1500.50, electricity: false, water: true, gas: true, lease_id: 2, building_id: 1, agent_id: 2)
puts "Done!"
