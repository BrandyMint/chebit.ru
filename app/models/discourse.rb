class Discourse < ActiveRecord::Base

  # attr_protected :is_moderated

  belongs_to :author, :class_name => "User"
  belongs_to :assigner, :class_name => "User"

  belongs_to :section

  validates_presence_of :subject

  default :is_moderated=>true

  acts_as_list :scope=>:section_id

  default_scope order(:position)

  before_save :set_author

  KIND=%w(discourse seminar other)

  def set_author
    self.author = self.assigner if assigner.present? && !author
  end

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

