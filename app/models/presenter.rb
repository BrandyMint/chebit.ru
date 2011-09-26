class Presenter < ActiveRecord::Base

  belongs_to :discourse
  belongs_to :user

  validates_presence_of :user, :discourse
  validates_uniqueness_of :user_id, :scope=>[:discourse_id]

  delegate :to_s, :to_label, :to=>:user

end
