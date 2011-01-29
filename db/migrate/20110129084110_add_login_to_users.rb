class AddLoginToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :login, :string, :null => false

    add_index :users, :login, :unique=>true
  end

  def self.down
    remove_column :users, :login
  end
end
