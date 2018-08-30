# frozen_string_literal: true

FactoryBot.define do
  factory :follower do
    will_ride { false }
    ride { nil }
    user { nil }
    pick_up_location { 'My String' }
  end
end
