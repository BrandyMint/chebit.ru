# -*- coding: utf-8 -*-
class AddTimeLengthToDiscourses < ActiveRecord::Migration
  def self.up
    add_column :discourses, :time_length, :integer, :null=>false, :default=>30

    # Время начала регистрации
    add_column :conferences, :registration_at, :time, :null=>false, :default=>'10:00'

    # Время начала конференции
    add_column :conferences, :start_at, :time, :null=>false, :default=>'11:00'

    # Начало перерыва
    add_column :conferences, :break_at, :time, :default=>'14:00'
    # Длительность перерыва
    add_column :conferences, :break_length, :integer, :null=>false, :default=>30

    Conference.update_all :break_at=>'14:00', :break_length => 30
    # Время окончания конференции.
    # TODO должно высчитываться автоматомс учетом перерыва на обед и длительности докладов
    add_column :conferences, :finish_at, :time

    Conference.all.map &:update_finish_time
  end

  def self.down
    remove_column :discourses, :time_length
    remove_column :conferences, :registration_at
    remove_column :conferences, :start_at
    remove_column :conferences, :break_at
    remove_column :conferences, :break_length
    remove_column :conferences, :finish_at
  end
end
