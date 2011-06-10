class AddNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :full_name, :string, :null => false, :default => ''
    add_column :users, :firm, :string
    add_column :users, :url, :string
    add_column :users, :occupation, :string
    add_column :users, :note, :text
    add_column :users, :discourse_state, :string
    add_column :users, :discourse_subject, :string

    add_index :users, :full_name
  end

  def self.down
    remove_column :users, :full_name
  end
end
