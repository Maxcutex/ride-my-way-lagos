# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_create :set_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :rides, dependent: :destroy
  has_many :followers

  scope :active_user, -> { where(is_active: true) }
  scope :inactive_user, -> { where(is_active: false) }

  validates_presence_of :first_name, :last_name, :email, :username

  def admin?
    has_role?(:admin)
  end

  def user?
    has_role?(:user)
  end

  private
  def set_default_role
    self.add_role(:user)
  end

end
