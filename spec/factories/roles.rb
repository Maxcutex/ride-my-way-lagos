FactoryBot.define do
  factory :role do
    name { 'Admin' }
  end
end

FactoryBot.define do
  factory :role_admin, class: 'Role' do
    name { 'admin' }
  end
end

FactoryBot.define do
  factory :role_user, class: 'Role' do
    name { 'user' }
  end
end
