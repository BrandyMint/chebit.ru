class RanameUrlToWebsiteInUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :url, :website
  end

  def self.down
    rename_column :users, :website, :url
  end
end
