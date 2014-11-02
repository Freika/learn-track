class Ability
    include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    alias_action :create, :read, :update, :destroy, to: :crud

    if user.role == 'admin'
      can :manage, :all
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard              # grant access to the dashboard
    elsif user.role == 'user'
      can :manage, Activity # , user_id: user.id
      can :create, Knowledge
    else
      can :read, :all
      # can :crud, :all, user_id: user.id
    end
  end
end
