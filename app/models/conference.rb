class Conference < ActiveRecord::Base

  be_commentable

  has_many :conference_sections
  has_many :sections, :through=>:conference_sections, :order=>:position
  has_many :discourses, :through=>:conference_sections
  has_many :registrations

  acts_as_taggable
  acts_as_taggable_on :tags


  def to_s
    name
  end

  def minutes_to_break
    (break_at - start_at)/60
  end

  def is_user_registered?(user)
    return false unless user
    registrations.exists? :user_id=>user.id
  end

  def not_registered_users
    registered_users = registrations.map &:user
    User.all.reject { |u| registered_users.include? u }
  end

  def vacancies
    c = hall_capacity-registrations.count
    c>0 ? c : 0
  end

  def update_finish_time
    total_minutes = (discourses.moderated.map(&:time_length).reduce(:+) + self.break_length)*60
    update_attribute :finish_at, self.start_at + total_minutes
  end
end
