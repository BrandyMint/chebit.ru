class AddMigrationToSections < ActiveRecord::Migration
  def self.up
    add_column :sections, :position, :integer, :null => false, :default => ''
    add_column :discourses, :position, :integer, :null => false, :default => ''
  end

  def self.down
    remove_column :sections, :position
    remove_column :discourses, :position
  end
end
