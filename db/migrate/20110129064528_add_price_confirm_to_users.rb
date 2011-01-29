class AddPriceConfirmToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :price_confirm, :boolean, :null=>false, :default=>true
  end

  def self.down
    remove_column :users, :price_confirm
  end
end
