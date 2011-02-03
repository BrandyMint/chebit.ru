class Section < ActiveRecord::Base
  has_many :discourses
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
#

