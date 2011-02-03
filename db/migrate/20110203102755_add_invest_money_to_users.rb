class AddInvestMoneyToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :invest_money, :decimal, :null=>false, :default=>0
  end

  def self.down
    remove_column :users, :invest_money
  end
end
