class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Post, Blog]
    if user
      can :manage, User, id: user.id
      can :manage, Blog, user_id: user.id
      can :manage, Post, blog_id: user.blogs.pluck(:id)
    end
  end
end
