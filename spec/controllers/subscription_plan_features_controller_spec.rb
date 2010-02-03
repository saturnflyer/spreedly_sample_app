require 'spec_helper'

describe SubscriptionPlanFeaturesController do

  def mock_subscription_plan_feature(stubs={})
    @mock_subscription_plan_feature ||= mock_model(SubscriptionPlanFeature, stubs)
  end

  describe "GET index" do
    it "assigns all subscription_plan_features as @subscription_plan_features" do
      SubscriptionPlanFeature.stub(:find).with(:all).and_return([mock_subscription_plan_feature])
      get :index
      assigns[:subscription_plan_features].should == [mock_subscription_plan_feature]
    end
  end

  describe "GET show" do
    it "assigns the requested subscription_plan_feature as @subscription_plan_feature" do
      SubscriptionPlanFeature.stub(:find).with("37").and_return(mock_subscription_plan_feature)
      get :show, :id => "37"
      assigns[:subscription_plan_feature].should equal(mock_subscription_plan_feature)
    end
  end

  describe "GET new" do
    it "assigns a new subscription_plan_feature as @subscription_plan_feature" do
      SubscriptionPlanFeature.stub(:new).and_return(mock_subscription_plan_feature)
      get :new
      assigns[:subscription_plan_feature].should equal(mock_subscription_plan_feature)
    end
  end

  describe "GET edit" do
    it "assigns the requested subscription_plan_feature as @subscription_plan_feature" do
      SubscriptionPlanFeature.stub(:find).with("37").and_return(mock_subscription_plan_feature)
      get :edit, :id => "37"
      assigns[:subscription_plan_feature].should equal(mock_subscription_plan_feature)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created subscription_plan_feature as @subscription_plan_feature" do
        SubscriptionPlanFeature.stub(:new).with({'these' => 'params'}).and_return(mock_subscription_plan_feature(:save => true))
        post :create, :subscription_plan_feature => {:these => 'params'}
        assigns[:subscription_plan_feature].should equal(mock_subscription_plan_feature)
      end

      it "redirects to the created subscription_plan_feature" do
        SubscriptionPlanFeature.stub(:new).and_return(mock_subscription_plan_feature(:save => true))
        post :create, :subscription_plan_feature => {}
        response.should redirect_to(subscription_plan_feature_url(mock_subscription_plan_feature))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved subscription_plan_feature as @subscription_plan_feature" do
        SubscriptionPlanFeature.stub(:new).with({'these' => 'params'}).and_return(mock_subscription_plan_feature(:save => false))
        post :create, :subscription_plan_feature => {:these => 'params'}
        assigns[:subscription_plan_feature].should equal(mock_subscription_plan_feature)
      end

      it "re-renders the 'new' template" do
        SubscriptionPlanFeature.stub(:new).and_return(mock_subscription_plan_feature(:save => false))
        post :create, :subscription_plan_feature => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested subscription_plan_feature" do
        SubscriptionPlanFeature.should_receive(:find).with("37").and_return(mock_subscription_plan_feature)
        mock_subscription_plan_feature.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :subscription_plan_feature => {:these => 'params'}
      end

      it "assigns the requested subscription_plan_feature as @subscription_plan_feature" do
        SubscriptionPlanFeature.stub(:find).and_return(mock_subscription_plan_feature(:update_attributes => true))
        put :update, :id => "1"
        assigns[:subscription_plan_feature].should equal(mock_subscription_plan_feature)
      end

      it "redirects to the subscription_plan_feature" do
        SubscriptionPlanFeature.stub(:find).and_return(mock_subscription_plan_feature(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(subscription_plan_feature_url(mock_subscription_plan_feature))
      end
    end

    describe "with invalid params" do
      it "updates the requested subscription_plan_feature" do
        SubscriptionPlanFeature.should_receive(:find).with("37").and_return(mock_subscription_plan_feature)
        mock_subscription_plan_feature.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :subscription_plan_feature => {:these => 'params'}
      end

      it "assigns the subscription_plan_feature as @subscription_plan_feature" do
        SubscriptionPlanFeature.stub(:find).and_return(mock_subscription_plan_feature(:update_attributes => false))
        put :update, :id => "1"
        assigns[:subscription_plan_feature].should equal(mock_subscription_plan_feature)
      end

      it "re-renders the 'edit' template" do
        SubscriptionPlanFeature.stub(:find).and_return(mock_subscription_plan_feature(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested subscription_plan_feature" do
      SubscriptionPlanFeature.should_receive(:find).with("37").and_return(mock_subscription_plan_feature)
      mock_subscription_plan_feature.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the subscription_plan_features list" do
      SubscriptionPlanFeature.stub(:find).and_return(mock_subscription_plan_feature(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(subscription_plan_features_url)
    end
  end

end
