class Conference < ActiveRecord::Base
  has_many :conference_sections
  has_many :sections, :through=>:conference_sections, :order=>:position
  has_many :discourses, :through=>:conference_sections

  def to_s
    name
  end
end
