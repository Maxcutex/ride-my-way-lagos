# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  belongs_to :role
  has_many :rides, dependent: :destroy
  has_many :followers

  scope :active_user, -> { where(is_active: true) }
  scope :inactive_user, -> { where(is_active: false) }
  
  validates_presence_of :first_name, :last_name, :email, :username
end
