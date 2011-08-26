class ResetCounters < ActiveRecord::Migration
  def self.up
    Comment.all.each do |c|
      puts c.id
      c.commentable.class.reset_counters c.commentable.id, :comments, :all_comments
      c.resource.class.reset_counters c.resource.id, :comments, :all_comments
    end
  end

  def self.down
  end
end
