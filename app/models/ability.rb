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
      can :create, Follower
      can :update, Follower do |follower|
        follower.try(:user) == user
      end
      can :update, User do |user_model|
        user_model.try(:user) == user
      end
      cannot :manage , Faq
    elsif user.admin?
      can :manage
    else
      can :read, :all
    end
  end
end
