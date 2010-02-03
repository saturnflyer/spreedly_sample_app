require 'spec_helper'

describe FeatureAttributesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/feature_attributes" }.should route_to(:controller => "feature_attributes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/feature_attributes/new" }.should route_to(:controller => "feature_attributes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/feature_attributes/1" }.should route_to(:controller => "feature_attributes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/feature_attributes/1/edit" }.should route_to(:controller => "feature_attributes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/feature_attributes" }.should route_to(:controller => "feature_attributes", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/feature_attributes/1" }.should route_to(:controller => "feature_attributes", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/feature_attributes/1" }.should route_to(:controller => "feature_attributes", :action => "destroy", :id => "1") 
    end
  end
end
