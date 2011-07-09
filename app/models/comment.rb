class Comment < ActiveRecord::Base
  attr_accessible :content, :commentable_id, :commentable_type, :author 
  validates_presence_of :commentable, :content, :author

  belongs_to :commentable, :polymorphic => true
  belongs_to :author, :class_name => "User"
  has_many :comments, :as => :commentable
end
