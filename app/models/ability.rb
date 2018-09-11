class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.user?
      can :manage, Ride, user_id: user.id
      can :manage, Follower, user_id: user.id
      can :read, Faq, :all
    elsif user.admin?
      can :manage
    else
      can :read, :all
    end
  end
end
