class AddIsPassedToConferences < ActiveRecord::Migration
  def self.up
    add_column :conferences, :is_passed, :boolean, :null=>false, :default=>false
  end

  def self.down
    remove_column :conferences, :is_passed
  end
end
