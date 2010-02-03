require 'spec_helper'

describe SubscriptionPlanFeaturesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/subscription_plan_features" }.should route_to(:controller => "subscription_plan_features", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/subscription_plan_features/new" }.should route_to(:controller => "subscription_plan_features", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/subscription_plan_features/1" }.should route_to(:controller => "subscription_plan_features", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/subscription_plan_features/1/edit" }.should route_to(:controller => "subscription_plan_features", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/subscription_plan_features" }.should route_to(:controller => "subscription_plan_features", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/subscription_plan_features/1" }.should route_to(:controller => "subscription_plan_features", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/subscription_plan_features/1" }.should route_to(:controller => "subscription_plan_features", :action => "destroy", :id => "1") 
    end
  end
end
