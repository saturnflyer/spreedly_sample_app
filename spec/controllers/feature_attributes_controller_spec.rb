require 'spec_helper'

describe FeatureAttributesController do

  def mock_feature_attribute(stubs={})
    @mock_feature_attribute ||= mock_model(FeatureAttribute, stubs)
  end

  describe "GET index" do
    it "assigns all feature_attributes as @feature_attributes" do
      FeatureAttribute.stub(:find).with(:all).and_return([mock_feature_attribute])
      get :index
      assigns[:feature_attributes].should == [mock_feature_attribute]
    end
  end

  describe "GET show" do
    it "assigns the requested feature_attribute as @feature_attribute" do
      FeatureAttribute.stub(:find).with("37").and_return(mock_feature_attribute)
      get :show, :id => "37"
      assigns[:feature_attribute].should equal(mock_feature_attribute)
    end
  end

  describe "GET new" do
    it "assigns a new feature_attribute as @feature_attribute" do
      FeatureAttribute.stub(:new).and_return(mock_feature_attribute)
      get :new
      assigns[:feature_attribute].should equal(mock_feature_attribute)
    end
  end

  describe "GET edit" do
    it "assigns the requested feature_attribute as @feature_attribute" do
      FeatureAttribute.stub(:find).with("37").and_return(mock_feature_attribute)
      get :edit, :id => "37"
      assigns[:feature_attribute].should equal(mock_feature_attribute)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created feature_attribute as @feature_attribute" do
        FeatureAttribute.stub(:new).with({'these' => 'params'}).and_return(mock_feature_attribute(:save => true))
        post :create, :feature_attribute => {:these => 'params'}
        assigns[:feature_attribute].should equal(mock_feature_attribute)
      end

      it "redirects to the created feature_attribute" do
        FeatureAttribute.stub(:new).and_return(mock_feature_attribute(:save => true))
        post :create, :feature_attribute => {}
        response.should redirect_to(feature_attribute_url(mock_feature_attribute))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved feature_attribute as @feature_attribute" do
        FeatureAttribute.stub(:new).with({'these' => 'params'}).and_return(mock_feature_attribute(:save => false))
        post :create, :feature_attribute => {:these => 'params'}
        assigns[:feature_attribute].should equal(mock_feature_attribute)
      end

      it "re-renders the 'new' template" do
        FeatureAttribute.stub(:new).and_return(mock_feature_attribute(:save => false))
        post :create, :feature_attribute => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested feature_attribute" do
        FeatureAttribute.should_receive(:find).with("37").and_return(mock_feature_attribute)
        mock_feature_attribute.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :feature_attribute => {:these => 'params'}
      end

      it "assigns the requested feature_attribute as @feature_attribute" do
        FeatureAttribute.stub(:find).and_return(mock_feature_attribute(:update_attributes => true))
        put :update, :id => "1"
        assigns[:feature_attribute].should equal(mock_feature_attribute)
      end

      it "redirects to the feature_attribute" do
        FeatureAttribute.stub(:find).and_return(mock_feature_attribute(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(feature_attribute_url(mock_feature_attribute))
      end
    end

    describe "with invalid params" do
      it "updates the requested feature_attribute" do
        FeatureAttribute.should_receive(:find).with("37").and_return(mock_feature_attribute)
        mock_feature_attribute.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :feature_attribute => {:these => 'params'}
      end

      it "assigns the feature_attribute as @feature_attribute" do
        FeatureAttribute.stub(:find).and_return(mock_feature_attribute(:update_attributes => false))
        put :update, :id => "1"
        assigns[:feature_attribute].should equal(mock_feature_attribute)
      end

      it "re-renders the 'edit' template" do
        FeatureAttribute.stub(:find).and_return(mock_feature_attribute(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested feature_attribute" do
      FeatureAttribute.should_receive(:find).with("37").and_return(mock_feature_attribute)
      mock_feature_attribute.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the feature_attributes list" do
      FeatureAttribute.stub(:find).and_return(mock_feature_attribute(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(feature_attributes_url)
    end
  end

end
