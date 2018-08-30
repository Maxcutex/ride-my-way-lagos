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
Role.create(
  [
    {
      role_name: 'Administrator',
      role_description: 'This is the main role and administrator of the system'
    },
    {
      role_name: 'Instructor',
      role_description: 'This is the owner of courses and can add/delete topics'
    },
    {
      role_name: 'Student',
      role_description: 'This is user of the application'
    }
  ]
)

