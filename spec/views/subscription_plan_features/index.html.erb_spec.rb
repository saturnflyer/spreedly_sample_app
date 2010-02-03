require 'spec_helper'

describe "/subscription_plan_features/index.html.erb" do
  include SubscriptionPlanFeaturesHelper

  before(:each) do
    assigns[:subscription_plan_features] = [
      stub_model(SubscriptionPlanFeature,
        :feature_level => "value for feature_level",
        :name => "value for name",
        :description => "value for description"
      ),
      stub_model(SubscriptionPlanFeature,
        :feature_level => "value for feature_level",
        :name => "value for name",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of subscription_plan_features" do
    render
    response.should have_tag("tr>td", "value for feature_level".to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
