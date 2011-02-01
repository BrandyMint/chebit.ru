# -*- coding: undecided -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Section.create(
               [
                :name => 'Инвестирование',
                :desc => 'Поиск финансов, бизнес-планирование'
               ],
               [
                :name=>'Front End',
                :desc=>'HTML, CSS, JavaScript, Flash'
                ],
               [
                :name=>'Маркетинг и продажи в сети',
                :desc=>'Методы привлечения посетителей, упаравление рекламными компаниями'
                ]
               )
