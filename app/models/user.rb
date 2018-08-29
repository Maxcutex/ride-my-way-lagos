class User < ApplicationRecord
  belongs_to :role
  has_many :rides, dependent: :destroy
  has_many :followers

  validates_presence_of :first_name, :last_name, :email, :username
end
