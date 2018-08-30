# frozen_string_literal: true

# Role Model
class Role < ApplicationRecord
  has_many :users, dependent: :destroy

  # validations
  validates_presence_of :role_name, :role_description
end
