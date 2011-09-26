class AddConferenceIdToDiscourses < ActiveRecord::Migration
  def self.up
    add_column :discourses, :conference_id, :integer
  end

  def self.down
    remove_column :discourses, :conference_id
  end
end
