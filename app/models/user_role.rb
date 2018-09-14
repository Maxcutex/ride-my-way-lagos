class UserRole < ApplicationRecord
  has_many :users 
  has_many :rides 
end