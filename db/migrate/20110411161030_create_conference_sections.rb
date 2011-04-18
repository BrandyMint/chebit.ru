class CreateConferenceSections < ActiveRecord::Migration
  def self.up
    create_table :conference_sections do |t|
      t.integer :section_id
      t.integer :conference_id
      t.integer :position
      t.timestamps
    end

    add_index :conference_sections, [:conference_id, :section_id], :unique=>true

    remove_column :sections, :conference_id

    add_column :discourses, :conference_id, :integer
  end

  def self.down
    drop_table :conference_sections
    add_column :sections, :conference_id, :integer
    remove_column :discourses, :conference_id

  end
end
