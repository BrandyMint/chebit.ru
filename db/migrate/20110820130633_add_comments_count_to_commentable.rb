class AddCommentsCountToCommentable < ActiveRecord::Migration
  def self.up
    add_column :discourses, :comments_count, :integer, :null=>false, :default=>0
    add_column :conferences, :comments_count, :integer, :null=>false, :default=>0
    (Discourse.all + Conference.all).each do |d|
      d.class.update_counters d.id, :comments_count=>d.comments.count
    end
  end

  def self.down
    remove_column :discourses, :comments_count
    remove_column :conferences, :comments_count
  end
end
