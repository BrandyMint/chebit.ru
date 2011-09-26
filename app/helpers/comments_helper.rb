# -*- coding: utf-8 -*-
module CommentsHelper
  def link_to_comments(commentable)
    title = commentable.all_comments_count>0 ? "Обсуждение (#{commentable.all_comments_count}).." : 'Обсуждение..'
    link_to title, polymorphic_path(commentable, :anchor=>'comments'), :class=>'comments-link'
  end

  def comments(commentable)
    render "comments/comments", :commentable=>commentable
  end

  def commentable_id(commentable)
    "#{commentable.class.to_s.underscore}-#{commentable.id}"
  end
end
