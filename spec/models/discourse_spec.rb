require 'spec_helper'

describe Discourse do
  pending "add some examples to (or delete) #{__FILE__}"
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

