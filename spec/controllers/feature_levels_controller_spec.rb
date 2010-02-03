require 'spec_helper'

describe FeatureLevelsController do

  def mock_feature_level(stubs={})
    @mock_feature_level ||= mock_model(FeatureLevel, stubs)
  end

  describe "GET index" do
    it "assigns all feature_levels as @feature_levels" do
      FeatureLevel.stub(:find).with(:all).and_return([mock_feature_level])
      get :index
      assigns[:feature_levels].should == [mock_feature_level]
    end
  end

  describe "GET show" do
    it "assigns the requested feature_level as @feature_level" do
      FeatureLevel.stub(:find).with("37").and_return(mock_feature_level)
      get :show, :id => "37"
      assigns[:feature_level].should equal(mock_feature_level)
    end
  end

  describe "GET new" do
    it "assigns a new feature_level as @feature_level" do
      FeatureLevel.stub(:new).and_return(mock_feature_level)
      get :new
      assigns[:feature_level].should equal(mock_feature_level)
    end
  end

  describe "GET edit" do
    it "assigns the requested feature_level as @feature_level" do
      FeatureLevel.stub(:find).with("37").and_return(mock_feature_level)
      get :edit, :id => "37"
      assigns[:feature_level].should equal(mock_feature_level)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created feature_level as @feature_level" do
        FeatureLevel.stub(:new).with({'these' => 'params'}).and_return(mock_feature_level(:save => true))
        post :create, :feature_level => {:these => 'params'}
        assigns[:feature_level].should equal(mock_feature_level)
      end

      it "redirects to the created feature_level" do
        FeatureLevel.stub(:new).and_return(mock_feature_level(:save => true))
        post :create, :feature_level => {}
        response.should redirect_to(feature_level_url(mock_feature_level))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved feature_level as @feature_level" do
        FeatureLevel.stub(:new).with({'these' => 'params'}).and_return(mock_feature_level(:save => false))
        post :create, :feature_level => {:these => 'params'}
        assigns[:feature_level].should equal(mock_feature_level)
      end

      it "re-renders the 'new' template" do
        FeatureLevel.stub(:new).and_return(mock_feature_level(:save => false))
        post :create, :feature_level => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested feature_level" do
        FeatureLevel.should_receive(:find).with("37").and_return(mock_feature_level)
        mock_feature_level.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :feature_level => {:these => 'params'}
      end

      it "assigns the requested feature_level as @feature_level" do
        FeatureLevel.stub(:find).and_return(mock_feature_level(:update_attributes => true))
        put :update, :id => "1"
        assigns[:feature_level].should equal(mock_feature_level)
      end

      it "redirects to the feature_level" do
        FeatureLevel.stub(:find).and_return(mock_feature_level(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(feature_level_url(mock_feature_level))
      end
    end

    describe "with invalid params" do
      it "updates the requested feature_level" do
        FeatureLevel.should_receive(:find).with("37").and_return(mock_feature_level)
        mock_feature_level.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :feature_level => {:these => 'params'}
      end

      it "assigns the feature_level as @feature_level" do
        FeatureLevel.stub(:find).and_return(mock_feature_level(:update_attributes => false))
        put :update, :id => "1"
        assigns[:feature_level].should equal(mock_feature_level)
      end

      it "re-renders the 'edit' template" do
        FeatureLevel.stub(:find).and_return(mock_feature_level(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested feature_level" do
      FeatureLevel.should_receive(:find).with("37").and_return(mock_feature_level)
      mock_feature_level.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the feature_levels list" do
      FeatureLevel.stub(:find).and_return(mock_feature_level(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(feature_levels_url)
    end
  end

end
