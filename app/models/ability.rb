# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new
    # Define User abilities
    # if user.is? :admin
    #   can :manage, Post
    # else
    #   can :read, Post
    # end
    can :read, User # all users can view users
    can :read, Post # all users can view posts
    can :read, Comment # all users can view comments
    return unless user.present?
    
    can :read, User # all users can view users
    can :manage, Post, user_id: user.id # only post owners can manage posts
    can :manage, Comment, user_id: user.id # only post owners can manage posts

    return unless user.is? :admin
    can :manage, :all
  end
end
