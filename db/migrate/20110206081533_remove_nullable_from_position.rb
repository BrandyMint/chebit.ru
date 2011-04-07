class RemoveNullableFromPosition < ActiveRecord::Migration
  def self.up
    change_column :discourses, :position, :integer, :null=>true
    change_column :sections, :position, :integer, :null=>true

  end

  def self.down
  end
end
