require 'faker'

Role.destroy_all
[:admin, :user].each do |role|
  Role.where({ name: role }, without_protection: true).first_or_create
end
User.destroy_all
user1 = User.create(
  first_name: 'Nili', last_name: 'Ach1', username: 'nili678',
  email: 'niliach1@example.com',
  password: 'iesha1', password_confirmation: 'iesha1', is_active: true,
  created_at: DateTime.now, updated_at: DateTime.now
)
user1.remove_role(:user)
user1.add_role(:admin)
user2 = User.create(
  first_name: 'David', last_name: 'Plate', username: 'nili6782',
  email: 'niliach2@example.com',
  password: 'iesha2', password_confirmation: 'iesha2', is_active: true,
  created_at: DateTime.now, updated_at: DateTime.now
)
user2.add_role(:user)
Ride.destroy_all

Ride.create(
  start_location: 'ET', end_location: 'home', is_active: true, rider_count: 6,
  date_ride: DateTime.now, is_completed: false, user_id: user1.id
)
Ride.create(
  start_location: 'home', end_location: 'ET', is_active: true, rider_count: 5,
  date_ride: DateTime.now, is_completed: false, user_id: user1.id
)
Ride.create(
  start_location: 'home', end_location: 'ET', is_active: true, rider_count: 2,
  date_ride: DateTime.now, is_completed: false, user_id: user2.id
)
Ride.create(
  start_location: 'home', end_location: 'ET', is_active: true, rider_count: 4,
  date_ride: DateTime.now, is_completed: false, user_id: user2.id
)

Faq.destroy_all

Faq.create(
  title: 'Can I Remove a Passenger?',
  answer: 'Right now, that feature is not available but we are looking to add it soon',
  is_active: true
)
Faq.create(
  title: 'What is the max waiting time to wait for a passenger?',
  answer: 'You can leave 5 mins after the scheduled movement time',
  is_active: true
)
Faq.create(
  title: 'Can I cancel the ride?',
  answer: 'Yes you can cancel the ride',
  is_active: true
)
