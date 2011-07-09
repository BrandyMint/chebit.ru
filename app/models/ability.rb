# -*- coding: utf-8 -*-
class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user (not logged in)

    # Неавторизованным ничего не разрешаем
    return false unless user

    #Задаем права 
     can :manage, :all if user.is_admin?   
     can :read, :all if ! user.is_admin?
     can :manage, Comment, :author => user
  end
  
end
