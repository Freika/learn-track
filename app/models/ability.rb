class Ability
    include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    alias_action :create, :read, :update, :destroy, to: :crud

    if user.role == 'admin'
      can :manage, :all
    elsif user.role == 'user'
      can :manage, Activity
      can :create, Knowledge
    else
      can :read, :all
      # can :crud, :all, user_id: user.id
    end
  end
end
