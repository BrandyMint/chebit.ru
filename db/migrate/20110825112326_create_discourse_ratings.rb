class CreateDiscourseRatings < ActiveRecord::Migration
  def self.up
    create_table :discourse_ratings do |t|
      t.integer :user_id, :null=>false
      t.integer :discourse_id, :null=>false
      t.integer :rate, :null=>false, :default=>1

      t.timestamps
    end

    add_column :discourses, :ratings_count, :integer, :null=>false, :default=>0
    add_column :discourses, :can_be_rated, :boolean, :null=>false, :default=>false
    add_index :discourse_ratings, [:user_id, :discourse_id], :unique=>true
  end

  def self.down
    remove_column :discourses, :ratings_count
    remove_column :discourses, :can_be_rated
    drop_table :discourse_ratings
  end
end
