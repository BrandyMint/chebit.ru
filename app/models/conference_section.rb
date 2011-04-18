class ConferenceSection < ActiveRecord::Base
  belongs_to :section
  belongs_to :conference

  default_scope order("conference_id desc, position")

  validates_presence_of :section
  validates_presence_of :conference

  validates_uniqueness_of :section_id, :scope=>:conference_id

  acts_as_list :scope=>:conference

  def to_s
    "#{conference} / #{section}"
  end

  def to_label
    to_s
  end
end
