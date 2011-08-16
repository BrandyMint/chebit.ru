class ChangeTextInVacancies < ActiveRecord::Migration
  def self.up
    change_column :vacancies, :text, :text
  end

  def self.down
    change_column :vacancies, :text, :string
  end
end
