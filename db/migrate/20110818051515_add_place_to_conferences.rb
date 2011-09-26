# -*- coding: utf-8 -*-
class AddPlaceToConferences < ActiveRecord::Migration
  def self.up
    add_column :conferences, :place, :string
    add_column :conferences, :address, :string
    c=Conference.find(2)
    c.update_attributes :place=>'Национальная Республиканская библиотека', :address=>'пр. Ленина, 15'

  end

  def self.down
    remove_column :conferences, :place
    # remove_column :conferences, :address
  end
end
