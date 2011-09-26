# -*- coding: utf-8 -*-
class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user (not logged in)

    can :read, :all
    return unless user
    can :manage, Comment, :author => user
    can :manage, :all if user.role? :admin
  end
end

