# frozen_string_literal: true

# followers model
class Follower < ApplicationRecord
  belongs_to :ride
  belongs_to :user

  scope :active_follower, -> { where(will_ride: true) }
  scope :inactive_follower, -> { where(will_ride: false) }

  def self.get_by_id(id)
    where(id: id).first
  end

  def self.get_by_user_id(id)
    where(user_id: id, will_ride: true)
  end

  def self.get_by_ride_id(id)
    where(ride_id: id, will_ride: true)
  end

  def self.get_by_id_ride_id(id, ride_id)
    where(id: id, ride_id: ride_id).first
  end
  validates :ride_id, :user_id, presence: true
end
