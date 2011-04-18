class Conference < ActiveRecord::Base
  has_many :conference_sections
  has_many :sections, :through=>:conference_sections
end
