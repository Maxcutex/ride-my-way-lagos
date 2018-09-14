# frozen_string_literal: true

# user role model
class UserRole < ApplicationRecord
  has_many :users
  has_many :rides
end
