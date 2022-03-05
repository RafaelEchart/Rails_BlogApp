class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, Post, user_id: user.id # if the user is logged in can manage it's own posts
    can :manage, Comment, user_id: user.id
  end
end
