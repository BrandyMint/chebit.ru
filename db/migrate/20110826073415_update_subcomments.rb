class UpdateSubcomments < ActiveRecord::Migration
  def self.up
    [:comments, :discourses, :conferences].each do |c|
      remove_column c, :subcomments_count
      add_column c, :all_comments_count, :integer, :null=>false, :default=>0
    end
  end

  def self.down
    [:comments, :discourses, :conferences].each do |c|
      add_column c, :subcomments_count, :integer, :null=>false, :default=>0
      remove_column c, :all_comments_count
    end
  end
end
