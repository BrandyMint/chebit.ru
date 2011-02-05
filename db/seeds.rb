# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Section.create!(
                [
                 {
                   :name=>'Инвестирование стартапов',
                   :desc=>'Поиск инвесторов, бизнес-планирование, презентация бизнес-идеи'
                 },
                 {
                   :name=>'Маркетинг и продажи в интернет',
                   :desc=>'Методы привлечения посетителей, упаравление рекламными компаниями'
                 },
                 {
                   :name=>'Front-end разработа',
                   :desc=>'HTML, CSS, JavaScript, Flash, Usability'
                 },
                 {
                   :name=>'Back-end разработка',
                   :desc=>'PHP, Perl, Ruby, TDD, Unix, SQL и т.д.'
                 }
               ] )
