# -*- coding: utf-8 -*-
class RegistrationsController < ApplicationController

  #Проверка аудентификации через devise
  before_filter :authenticate_user!, :only=>[:create, :destroy]
  before_filter :find_conference

  #Создание комментария
  def create
    flash[:notice] = 'Поздравляю, вы записаны на конференцию!'
    current_user.registrations.create!(:conference=>@conference)
    redirect_to @conference
  end

  def index
    @registered_users = @conference.registrations.map &:user
  end

  private

  def find_conference
    @conference = Conference.find(params[:conference_id])
  end


end
