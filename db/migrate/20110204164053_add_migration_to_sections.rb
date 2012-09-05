class AddMigrationToSections < ActiveRecord::Migration
  def self.up
    add_column :sections, :position, :integer, :null => false, :default => 0
    add_column :discourses, :position, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :sections, :position
    remove_column :discourses, :position
  end
end
