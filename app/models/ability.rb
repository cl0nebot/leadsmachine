class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    if (user.client? || user.prospect?)
      can :read, Machine, user_id: user.id
      can :read, Machine, user_id: nil
      can :read, Company, user_id: user.id
      can :manage, Property
      #can :read, Property, user_id: user.id

    elsif user.admin?
      can :manage, :all
    else
      can :read, Machine, user_id: nil
      cannot :read, Citation
    end
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
