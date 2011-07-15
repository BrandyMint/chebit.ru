class ConferencesController < ApplicationController
  # GET /conferences
  # GET /conferences.xml
  def index
    @conferences = Conference.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @conferences }
    end
  end

  # GET /conferences/1
  # GET /conferences/1.xml
  def show
    @conference = Conference.find(params[:id])

    @discourse = Discourse.new #(:conference => @conference)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @conference }
    end
  end
end
