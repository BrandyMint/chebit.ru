class AddHallCapacityToConferences < ActiveRecord::Migration
  def self.up
    add_column :conferences, :hall_capacity, :integer, :null=>false, :default=>90
  end

  def self.down
    remove_column :conferences, :hall_capacity
  end
end
