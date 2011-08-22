class Conference < ActiveRecord::Base

  has_many :conference_sections
  has_many :sections, :through=>:conference_sections, :order=>:position
  has_many :discourses, :through=>:conference_sections
  has_many :registrations

  has_many :comments, :as => :commentable
  attr_readonly :comments_count


  def to_s
    name
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
    hall_capacity-registrations.count
  end

  def update_finish_time
    total_minutes = (discourses.where(:is_moderated=>true).map(&:time_length).reduce(:+) + self.break_length)*60
    update_attribute :finish_at, self.start_at + total_minutes
  end
end
