class CreateDiscourses < ActiveRecord::Migration
  def self.up
    create_table :discourses do |t|
      t.string :subject
      t.text :text
      t.integer :author_id
      t.integer :assigner_id

      t.timestamps
    end
  end

  def self.down
    drop_table :discourses
  end
end
