# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new
    can :manage, Post, user_id: user.id # if the user is logged in can manage it's own posts
    can :create, Comment # logged in users can also create comments
    can :create, Like # logged in users can also create likes

    return unless user.admin?
    can :manage, :all # finally we give all remaining permissions only to the 
  end
end
