# frozen_string_literal: true

# Ride Model
class Ride < ApplicationRecord
  belongs_to :user
  has_many :followers, dependent: :destroy

  validates_presence_of :start_location, :end_location, :rider_count, :date_ride, :user_id

  def self.get_by_id(id)
    where(id: id, is_active: true).includes(:followers).first
  end

  def self.find_by_id(id)
    where(id: id).first
  end

  def self.active_rides
    where(is_active: true, is_completed: false).includes(:followers).all
  end



  def self.created_by(user_id)
    where(user_id: user_id, is_active: true).includes(:followers).all
  end

  def self.subscribed_by(user_id)
    @subscribed = Follower.get_by_user_id(user_id).all.map do |user_enroll|
      user_enroll.ride_id if user_enroll.user_id == user_id
    end
    @user_rides = @subscribed.compact.map do |ride_id|
      Ride.find_by_id(ride_id).includes(:followers).all
    end
  end

  def self.search_by(search_value, option)
    case option
    when 'start'
      where('start_location LIKE  ?', "%#{search_value}%")
      .where(is_active: true, is_completed: false)
      .includes(:followers).all
    when 'end'
      where('end_location LIKE ? ', "%#{search_value}%")
      .where(is_active: true, is_completed: false)
      .includes(:followers).all
    else
      where('start_location LIKE ? or end_location LIKE ?', "%#{search_value}%", "%#{search_value}%")
      .where(is_active: true, is_completed: false)
      .includes(:followers).all
    end
  end
end
