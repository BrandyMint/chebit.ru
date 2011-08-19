# -*- coding: utf-8 -*-
module ApplicationHelper

  def comments(commentable)
    render "comments/comments", :commentable=>commentable
  end

  def show_tag(tag)
    link_to(tag, users_path(:tags=>tag)).html_safe
  end

  def show_tags(tags)
    content_tag :ul, :class=>:tags do
      tags.map do |tag|
        content_tag :li, :class=>:tag do
          show_tag tag
        end
      end.join(', ').html_safe
    end
  end

  def show_table( record, fields)
    klass = record.class.name.underscore
    content_tag :table, :class=>"show_table #{klass}" do
      fields.map do |field|
         content_tag :tr do
          content_tag( :th, record.class.human_attribute_name( field )) <<
            content_tag( :td, record.respond_to?("show_#{field}") ? record.send( "show_#{field}" ) : record.send( field ), :class=>"#{klass}_#{field}" )
         end
      end.join.html_safe
    end
  end

  def go_back(path=nil)
    path||=:back
    (
     content_tag( :div, '', :class=>'clear') <<
     link_to( "&larr; назад".html_safe, path, :class => 'back' )
     )
  end

end
