class ConferenceSection < ActiveRecord::Base
  belongs_to :section
  belongs_to :conference

  validates_presence_of :section
  validates_presence_of :conference

  validates_uniqueness_of :section_id, :scope=>:conference_id


  acts_as_list :scope=>:conference
end
