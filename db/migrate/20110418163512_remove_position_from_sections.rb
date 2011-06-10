class RemovePositionFromSections < ActiveRecord::Migration
  def self.up
    remove_column :sections, :position
  end

  def self.down
    add_column :sections, :position, :integer
  end
end
