module Commentable
  def be_commentable
    extend ClassMethods
    include InstanceMethods

    attr_readonly :comments_count, :all_comments_count
    has_many :comments, :as => :commentable, :dependent => :destroy
    has_many :all_comments, :as => :resource, :class_name=>'Comment', :dependent => :destroy
  end

  module ClassMethods
  end

  module InstanceMethods
  end
end

ActiveRecord::Base.extend Commentable
