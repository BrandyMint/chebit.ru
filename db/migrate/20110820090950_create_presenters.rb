class CreatePresenters < ActiveRecord::Migration
  def self.up
    create_table :presenters do |t|
      t.integer :user_id, :null=>false
      t.integer :discourse_id, :null=>false

      t.timestamps
    end

    Discourse.all.each do |d|
      Presenter.create!(:user_id=>d.assigner.id, :discourse_id=>d.id) if d.assigner
    end

    add_index :presenters, [:discourse_id, :user_id], :unique=>true
  end

  def self.down
    drop_table :presenters
  end
end
