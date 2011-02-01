require "spec_helper"

describe DiscoursesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/discourses" }.should route_to(:controller => "discourses", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/discourses/new" }.should route_to(:controller => "discourses", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/discourses/1" }.should route_to(:controller => "discourses", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/discourses/1/edit" }.should route_to(:controller => "discourses", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/discourses" }.should route_to(:controller => "discourses", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/discourses/1" }.should route_to(:controller => "discourses", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/discourses/1" }.should route_to(:controller => "discourses", :action => "destroy", :id => "1")
    end

  end
end
