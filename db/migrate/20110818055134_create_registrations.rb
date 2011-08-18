class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.integer :user_id, :null=>false
      t.integer :conference_id, :null=>false

      t.timestamps
    end

    add_index :registrations, [:conference_id, :user_id], :unique=>true
  end

  def self.down
    drop_table :registrations
  end
end
