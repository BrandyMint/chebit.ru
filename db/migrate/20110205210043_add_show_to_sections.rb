class AddShowToSections < ActiveRecord::Migration
  def self.up
    add_column :sections, :show, :boolean, :null => false, :default => true
  end

  def self.down
    remove_column :sections, :show
  end
end
