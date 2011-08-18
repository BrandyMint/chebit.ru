# -*- coding: utf-8 -*-
class RegistrationsController < ApplicationController

  #Проверка аудентификации через devise
  before_filter :authenticate_user!, :only=>[:create, :destroy]

  #Создание комментария
  def create
    conference = Conference.find(params[:conference_id])
    current_user.registrations.create!(:conference=>conference)
    redirect_to conference
  end

end
