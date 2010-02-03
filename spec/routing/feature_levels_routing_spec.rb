require 'spec_helper'

describe FeatureLevelsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/feature_levels" }.should route_to(:controller => "feature_levels", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/feature_levels/new" }.should route_to(:controller => "feature_levels", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/feature_levels/1" }.should route_to(:controller => "feature_levels", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/feature_levels/1/edit" }.should route_to(:controller => "feature_levels", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/feature_levels" }.should route_to(:controller => "feature_levels", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/feature_levels/1" }.should route_to(:controller => "feature_levels", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/feature_levels/1" }.should route_to(:controller => "feature_levels", :action => "destroy", :id => "1") 
    end
  end
end
