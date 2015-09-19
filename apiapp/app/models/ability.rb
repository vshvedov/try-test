class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      # Warning! :manage is tricky and could be not only limited by CRUD!
      can :manage, :all
    end

    if user.has_role? :user
      can [:read, :create], :all
      can [:update, :destroy], Post, user_id: user.id
      can [:update, :destroy], Comment, user_id: user.id
      can [:comments, :add_comment], Post
      cannot :manage, User
    end

    if user.has_role? :guest
      can :read, :all
      cannot :manage, User
    end
  end
end
