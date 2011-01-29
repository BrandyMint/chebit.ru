class AddTelToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :tel, :string# , :null=>false

    #add_index :users, :tel, :unique =>
  end

  def self.down
    remove_column :users, :tel
  end
end
