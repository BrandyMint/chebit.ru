class AddKindToDiscourses < ActiveRecord::Migration
  def self.up
    add_column :discourses, :kind, :string, :null=>false, :default=>'discourse'
  end

  def self.down
    remove_column :discourses, :kind
  end
end
