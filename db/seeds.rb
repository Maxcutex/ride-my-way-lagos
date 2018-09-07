# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'database_cleaner'
DatabaseCleaner.clean_with :truncation

Role.destroy_all

Role.create(name: :admin)
Role.create(name: :user)

User.destroy_all
user1 = User.create(first_name: 'Nili', last_name: 'Ach1', username: 'nili678',
  email: 'niliach1@example.com',
  password: 'iesha1', password_confirmation: 'iesha1', is_active: true,
  created_at: DateTime.now, updated_at: DateTime.now)
# user1.add_role(:admin)
user2 = User.create(first_name: 'David', last_name: 'Plate', username: 'nili6782',
  email: 'niliach2@example.com',
  password: 'iesha2', password_confirmation: 'iesha2', is_active: true,
  created_at: DateTime.now, updated_at: DateTime.now)
#user2.add_role(:user)

Ride.destroy_all

Ride.create(
  start_location: 'ET', end_location: 'home', is_active: true, rider_count: 6,
  date_ride: DateTime.now, is_completed: false, user_id: user1.id
)
Ride.create(
  start_location: 'home', end_location: 'ET', is_active: true, rider_count: 5,
  date_ride: DateTime.now, is_completed: false, user_id: user1.id
)

