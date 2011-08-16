class ChangeActiveUntilColumnFromVacancies < ActiveRecord::Migration
  def self.up
    remove_column :vacancies, :active_until
    add_column :vacancies, :active_until, :date
  end

  def self.down
  end
end
