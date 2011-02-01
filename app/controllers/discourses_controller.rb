class DiscoursesController < ApplicationController
  # GET /discourses
  # GET /discourses.xml
  def index
    @discourses = Discourse.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @discourses }
    end
  end

  # GET /discourses/1
  # GET /discourses/1.xml
  def show
    @discourse = Discourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @discourse }
    end
  end

  # GET /discourses/new
  # GET /discourses/new.xml
  def new
    @discourse = Discourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @discourse }
    end
  end

  # GET /discourses/1/edit
  def edit
    @discourse = Discourse.find(params[:id])
  end

  # POST /discourses
  # POST /discourses.xml
  def create
    @discourse = Discourse.new(params[:discourse])

    respond_to do |format|
      if @discourse.save
        format.html { redirect_to(@discourse, :notice => 'Discourse was successfully created.') }
        format.xml  { render :xml => @discourse, :status => :created, :location => @discourse }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @discourse.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /discourses/1
  # PUT /discourses/1.xml
  def update
    @discourse = Discourse.find(params[:id])

    respond_to do |format|
      if @discourse.update_attributes(params[:discourse])
        format.html { redirect_to(@discourse, :notice => 'Discourse was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @discourse.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /discourses/1
  # DELETE /discourses/1.xml
  def destroy
    @discourse = Discourse.find(params[:id])
    @discourse.destroy

    respond_to do |format|
      format.html { redirect_to(discourses_url) }
      format.xml  { head :ok }
    end
  end
end
