class Discourse < ActiveRecord::Base

  attr_protected :moderated?

  belongs_to :author, :class_name => User
  belongs_to :assigner, :class_name => User

  belongs_to :section
  
  
end

# == Schema Information
#
# Table name: discourses
#
#  id          :integer         not null, primary key
#  subject     :string(255)
#  text        :text
#  author_id   :integer
#  assigner_id :integer
#  section_id  :integer
#  moderated?  :boolean         default(FALSE), not null
#  created_at  :datetime
#  updated_at  :datetime
#

