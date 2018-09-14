class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.user?
      can :read, :all
      can :create, Ride
      can :update, Ride do |ride|
        ride.try(:user) == user # || user.role?(:moderator)
      end
      can :edit, Ride do |ride|
        ride.try(:user) == user
      end
      can :destroy, Ride do |ride|
        ride.try(:user) == user
      end
      can :create, Follower
      can :update, Follower do |follower|
        follower.try(:user) == user
      end
      can :edit, Follower do |follower|
        follower.try(:user) == user
      end
      can :destroy, Follower do |follower|
        follower.try(:user) == user
      end
      can :remove, Follower do |follower|
        follower.try(:user) == user
      end
      can :update, User do |user_model|
        user_model.try(:user) == user
      end
      cannot :manage, Faq
      can :subscribed_rides, Ride
      can :created_rides, Ride
      can :search, Ride
      can :find, Ride
    elsif user.admin?
      can :manage, :all
      can :manage, Faq
    else
      can :read, :all
      can :search, Ride, :all
    end
  end
end
