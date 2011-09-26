class SetConferenceInDiscourses < ActiveRecord::Migration
  def self.up

    Discourse.all.each do |d|
      d.send :set_conference
      d.save!
    end

  end

  def self.down
  end
end
