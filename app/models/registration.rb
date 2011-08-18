class Registration < ActiveRecord::Base
  belongs_to :conference
  belongs_to :user

  validates_presence_of :user, :conference
  validates_uniqueness_of :user_id, :scope=>:conference_id
end
