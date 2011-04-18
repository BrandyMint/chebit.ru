require "spec_helper"

describe ConferencesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/conferences" }.should route_to(:controller => "conferences", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/conferences/new" }.should route_to(:controller => "conferences", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/conferences/1" }.should route_to(:controller => "conferences", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/conferences/1/edit" }.should route_to(:controller => "conferences", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/conferences" }.should route_to(:controller => "conferences", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/conferences/1" }.should route_to(:controller => "conferences", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/conferences/1" }.should route_to(:controller => "conferences", :action => "destroy", :id => "1")
    end

  end
end
