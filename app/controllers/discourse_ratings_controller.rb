class DiscourseRatingsController < ApplicationController
  before_filter :authenticate_user!, :only=>[:create, :destroy]

  layout nil

  def create
    @discourse = Discourse.find(params[:discourse_id])
    @discourse.ratings.create(:user=>current_user)
    @discourse.reload
  end
end
