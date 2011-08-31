class Comment < ActiveRecord::Base
  be_commentable

  attr_accessible :content, :commentable_id, :commentable_type, :author, :resource_id

  belongs_to :commentable, :polymorphic => true, :counter_cache=>:comments_count
  belongs_to :resource, :polymorphic => true, :counter_cache=>:all_comments_count

  belongs_to :author, :class_name => "User"

  default_scope  order('id')

  before_validation :set_resource

  validates_presence_of :commentable, :content, :author, :resource

  after_create :notify_subscribers

  private

  # def to_s
  #   content
  # end

  def set_resource
    self.resource = commentable.is_a?(Comment) ? commentable.resource : commentable if self.resource_id.nil?
  end

  def notify_subscribers
    Notifier.new_comment(self).deliver!
  end

end

