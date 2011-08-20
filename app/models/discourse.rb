# -*- coding: utf-8 -*-
class Discourse < ActiveRecord::Base

  # attr_protected :is_moderated

  has_many :comments, :as => :commentable
  has_many :presenters
  has_many :presenters_users, :through=>:presenters, :source=>:user

  belongs_to :author, :class_name => "User"

  # TODO: remove
  belongs_to :assigner, :class_name => "User"
  belongs_to :section
  belongs_to :conference_section
  has_one :conference, :through => :conference_section

  validates_presence_of :subject

  # default :is_moderated=>true


  acts_as_list :scope=>:conference_section_id

  default_scope order(:position)

  # Темы которые никто не взял езе
  scope :free, where(:assigner_id=>nil)

  before_save :set_author

  KIND=%w(discourse seminar other)

  def set_author
    self.author = self.assigner if assigner.present? && !author
  end

  def to_s
    subject
  end

  def to_label
    to_s
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

