class WelcomeController < ApplicationController

  before_filter :prepare_tags

  def index
  end

  def reports

  end

  def banner
    render :layout => 'banner'
  end

  def details

  end

  private

  def prepare_tags
    @tags = User.tag_counts
  end

end
