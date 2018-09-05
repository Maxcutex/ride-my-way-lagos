# frozen_string_literal: true

FactoryBot.define do
  sequence(:username) { |n| "user#{n}" }
  sequence :email do |n|
    "00#{n}@mi6.com"
  end
  factory :user do
    first_name { 'MyString' }
    last_name { 'MyString' }
    email
    is_active { false }
    username
    password { 'MyString' }
    password_confirmation { 'MyString' }
  end
end
