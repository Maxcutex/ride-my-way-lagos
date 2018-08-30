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
      role_name: 'User',
      role_description: 'This is a normal user or rider of the system'
    }
  ]
)
User.destroy_all

User.create(
  [
    {
      first_name: 'Nili', last_name: 'Ach1', username: 'nili678',
      email: 'niliach1@example.com',
      password: 'iesha1', password_confirmation: 'iesha1', is_active: true,
      created_at: DateTime.now, updated_at: DateTime.now, role_id:1
    },
    {
      first_name: 'David', last_name: 'Plate', username: 'nili6782',
      email: 'niliach2@example.com',
      password: 'iesha2', password_confirmation: 'iesha2', is_active: true,
      created_at: DateTime.now, updated_at: DateTime.now, role_id:2
    },
    {
      first_name: 'Femi', last_name: 'Lanre', username: 'nili6783',
      email: 'niliach3@example.com',
      password: 'iesha3', password_confirmation: 'iesha3', is_active: true,
      created_at: DateTime.now, updated_at: DateTime.now, role_id:2
    },
    {
      first_name: 'Jay', last_name: 'Bassey', username: 'nili6784',
      email: 'ennyboy1@gmail.com',
      password: 'iesha4', password_confirmation: 'iesha4', is_active: true,
      created_at: DateTime.now, updated_at: DateTime.now, role_id:2
    },
    {
      first_name: 'Eno', last_name: 'Bassey', username: 'eno.bassey',
      email: 'eno.bassey1@andela.com',
      password: 'iesha5', password_confirmation: 'iesha5', is_active: true,
      created_at: DateTime.now, updated_at: DateTime.now, role_id:2
    }
  ]
)