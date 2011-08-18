class Conference < ActiveRecord::Base
  has_many :conference_sections
  has_many :sections, :through=>:conference_sections, :order=>:position
  has_many :discourses, :through=>:conference_sections
  has_many :registrations

  def to_s
    name
  end

  def calculate_finish_time
    total_minutes = (discourses.all.map(&:time_length).reduce(:+) + self.break_length)*60
    update_attribute :finish_at, self.start_at + total_minutes
  end
end
