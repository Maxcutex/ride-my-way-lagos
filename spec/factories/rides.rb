# frozen_string_literal: true

FactoryBot.define do
  factory :ride do
    start_location { 'MyString' }
    end_location { 'MyString' }
    is_active { false }
    rider_count { 1 }
    date_ride { '2018-08-29' }
    is_completed { false }
    user { nil }
    comment { 'MyString' }
  end
end
