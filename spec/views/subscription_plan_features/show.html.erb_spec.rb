require 'spec_helper'

describe "/subscription_plan_features/show.html.erb" do
  include SubscriptionPlanFeaturesHelper
  before(:each) do
    assigns[:subscription_plan_feature] = @subscription_plan_feature = stub_model(SubscriptionPlanFeature,
      :feature_level => "value for feature_level",
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ feature_level/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
  end
end
