class DiscourseRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :discourse, :counter_cache=>:ratings_count

  validates_presence_of :user_id, :discourse_id
  validates_uniqueness_of :user_id, :scope=>:discourse_id
end
