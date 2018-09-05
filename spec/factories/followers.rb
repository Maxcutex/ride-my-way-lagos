# frozen_string_literal: true

FactoryBot.define do
  factory :follower do
    will_ride { true }
    association :user, factory: :user
    association :ride, factory: :ride
    pick_up_location { 'My String' }
  end
end
