class CreateConferences < ActiveRecord::Migration
  def self.up
    create_table :conferences do |t|
      t.string :name
      t.date :date
      t.text :desc

      t.timestamps
    end

    add_column :sections, :conference_id, :integer
  end

  def self.down
    drop_table :conferences
  end
end
