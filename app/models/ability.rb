# -*- coding: utf-8 -*-
class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user (not logged in)
    # Неавторизованным ничего не разрешаем
    return false unless user

    #Полный доступ, если пользователь в роли админа
    if user.role? :admin
     can :manage, :all    
    end

    #Если пользователь не в роли админа
    if not user.role? :admin
      #читать
      can :read, :all
      # полный доступ, если пользователь владелец объекта 
      can :manage, Comment, :author => user
    end
  end
end

