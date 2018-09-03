# frozen_string_literal: true

# Ride Model
class Ride < ApplicationRecord
  belongs_to :user
  has_many :followers, dependent: :destroy

  validates_presence_of :start_location, :end_location, :rider_count, :date_ride, :user_id
end
