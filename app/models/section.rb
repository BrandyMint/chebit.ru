# -*- coding: utf-8 -*-
class Section < ActiveRecord::Base
  has_many :discourses
  has_many :conference_sections
  has_many :conferences, :through=>:conference_sections

  # Не нужны, есть в conference_sections
  # acts_as_list
  # default_scope order(:position)

  scope :show, where(:show=>true)

  def to_s
    name
  end
end


# == Schema Information
#
# Table name: sections
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  desc       :text
#  created_at :datetime
#  updated_at :datetime
#  position   :integer         not null
#  show       :boolean         default(TRUE), not null
#

