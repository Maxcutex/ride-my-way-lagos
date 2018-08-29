FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    is_active { false } 
    username { "MyString" }
    password_digest { "MyString" }
    role { nil }
  end
end
