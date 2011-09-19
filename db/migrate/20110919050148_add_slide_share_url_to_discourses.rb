class AddSlideShareUrlToDiscourses < ActiveRecord::Migration
  def self.up
    add_column :discourses, :slide_url, :string
    add_column :discourses, :video_url, :string
  end

  def self.down
    remove_column :discourses, :slide_url
    remove_column :discourses, :video_url
  end
end
