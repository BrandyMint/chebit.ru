# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title(page_title, show_title = true)
    content_for(:title) { h(page_title.to_s) }
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end
  
  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

  def show_flash
    return '' if flash.empty?
    s = content_tag :div, :class => 'flashes' do 
      html = flash.map do |name, msg|
        # next unless name==:error
        klass = name
        klass = 'notice' if name.to_s=='alert'
        klass = 'error' if name.to_s=='failure'
        content_tag :div, msg.html_safe, :class => klass
      end
      html.to_s.html_safe
    end
    s
  end

  
end
