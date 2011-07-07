class Comment < ActiveRecord::Base
  attr_accessible :content, :commentable_id, :commentable_type
  belongs_to :commentable, :polymorphic => true
  belongs_to :author, :class_name => "User"
  has_many :comments, :as => :commentable
end
