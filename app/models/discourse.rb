# -*- coding: utf-8 -*-
class Discourse < ActiveRecord::Base

  be_commentable

  has_many :ratings, :class_name=>'DiscourseRating'
  has_many :presenters
  has_many :assigners, :through=>:presenters, :source=>:user

  belongs_to :author, :class_name => "User"

  # TODO: remove
  belongs_to :assigner, :class_name => "User"
  belongs_to :section
  belongs_to :conference_section
  # has_one :conference, :through => :conference_section
  belongs_to :conference

  acts_as_taggable
  acts_as_taggable_on :tags

  validates_presence_of :subject

  # default :is_moderated=>true


  acts_as_list :scope=>:conference_section_id

  default_scope order(:position)

  scope :moderated, where(:is_moderated=>true)

  # Темы которые никто не взял езе
  scope :free, where(:assigner_id=>nil)

  before_save :set_author
  before_save :update_conferences_finish_at
  before_save :set_conference

  KIND=%w(discourse seminar other)

  def to_s
    subject
  end

  def to_label
    to_s
  end

  def is_rated_by_user?(user)
    return false unless user
    ratings.exists?(:user_id=>user.id)
  end

  private

  def set_author
    self.author = self.assigner if assigner.present? && !author
  end

  def set_conference
    self.conference_id = self.conference_section.conference_id if self.conference_section_id and self.conference_section
  end

  def conference_was
    return false unless conference_section_id_was
    ConferenceSection.find(conference_section_id_was).try :conference
  end

  def update_conferences_finish_at
    conference_was.update_finish_time if conference_section_id_changed? and conference_was.present?
    conference.update_finish_time if conference.present?
  end

end


# == Schema Information
#
# Table name: discourses
#
#  id           :integer         not null, primary key
#  subject      :string(255)
#  text         :text
#  author_id    :integer
#  assigner_id  :integer
#  section_id   :integer
#  is_moderated :boolean         default(FALSE), not null
#  created_at   :datetime
#  updated_at   :datetime
#  position     :integer         not null
#  kind         :string(255)     default("discourse"), not null
#
