class AddShortDescToConferences < ActiveRecord::Migration
  def self.up
    add_column :conferences, :subject, :string
  end

  def self.down
    remove_column :conferences, :subject
  end
end
