class AddResourceIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :resource_id, :integer
    add_column :comments, :resource_type, :string

    # add_column :comments, :subcomments_count, :integer, :null=>false, :default=>0
    # add_column :discourses, :subcomments_count, :integer, :null=>false, :default=>0
    # add_column :conferences, :subcomments_count, :integer, :null=>false, :default=>0

    Comment.where(:commentable_type=>'Comment').destroy_all
    Comment.all.each do |c|
      c.send :set_resource
      c.save!
    end
    change_column :comments, :resource_id, :integer, :null=>false
    change_column :comments, :resource_type, :string, :null=>false
  end

  def self.down
    remove_column :comments, :resource_id
    remove_column :comments, :resource_type

    remove_column :comments, :subcomments_count
    remove_column :discourses, :subcomments_count
    remove_column :conferences, :subcomments_count
  end
end
