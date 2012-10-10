# encoding: utf-8

class WelcomeController < ApplicationController

  before_filter :prepare_tags

  def index
  end

  def reports
    redirect_to :action => :report_2012_10
  end

  def report_2012_10
    @videos = [
        {number: 1, author: "Александр Логунов", title: "Метапрограммирование в Ruby"},
        {number: 2, author: "Игорь Исаев", title: "Функциональное программирование"},
        {number: 3, author: "Дмитрий Максимов", title: "Использование Ruby & RSpec для тестирования нерубишного проекта"},
        {number: 4, author: "Александр Щербинин", title: "ООП дизайн: правила хорошего тона, SOLID"},
        {number: 5, author: "Данил Письменный", title: "ActiveAdmin это рельсы будущего"},
        {number: 6, author: "Nick Recorba", title: "Инфраструктура веб-приложений в компании Undev"},
        {number: 7, author: "Алексеей Макеев", title: "Apache Hadoop в Вашем проекте"},
        {number: 8, author: "Антон Каляев", title: "Автоматизация тестирования в RoR"},
    ]

    # get video files
    files_dir = Pathname.new(Rails.root.join("public", "system", "chebit-12-10"))
    @videos.each do |item|
      [:webm, :mp4].each do |type|
        file_path = Dir[File.join(files_dir, "chebit-2012-10_#{item[:number]}*.#{type}")].first
        item[type] = file_path.sub(/^#{Rails.root}\/public/, "") if file_path
      end
    end
  end

  def report_2011_02_10
    render 'reports'
  end

  def banner
    render :layout => 'banner'
  end

  def details

  end

  private

  def prepare_tags
    @tags = User.tag_counts
  end

end
