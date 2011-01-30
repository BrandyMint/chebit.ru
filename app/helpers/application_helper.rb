# -*- coding: utf-8 -*-
module ApplicationHelper
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

  def go_back
    (
     content_tag( :div, '', :class=>'clear') << 
     link_to( "&larr; назад".html_safe, :back, :class => 'back' )
     )
  end
end
