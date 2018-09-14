# frozen_string_literal: true

FactoryBot.define do
  factory :user_role_admin, class: 'UserRole' do
    association :role, factory: :role_admin
    association :user, factory: :user
    is_active { true }
  end
  
  factory :user_role_user, class: 'UserRole' do
    association :role, factory: :role_user
    association :user, factory: :user
    is_active { true }
  end
end 