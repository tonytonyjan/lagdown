class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, Blog, user_id: user.id
      can :manage, Post, blog_id: user.blogs.pluck(:id)
    end
  end
end
