require 'spec_helper'

describe "/subscription_plan_features/new.html.erb" do
  include SubscriptionPlanFeaturesHelper

  before(:each) do
    assigns[:subscription_plan_feature] = stub_model(SubscriptionPlanFeature,
      :new_record? => true,
      :feature_level => "value for feature_level",
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders new subscription_plan_feature form" do
    render

    response.should have_tag("form[action=?][method=post]", subscription_plan_features_path) do
      with_tag("input#subscription_plan_feature_feature_level[name=?]", "subscription_plan_feature[feature_level]")
      with_tag("input#subscription_plan_feature_name[name=?]", "subscription_plan_feature[name]")
      with_tag("textarea#subscription_plan_feature_description[name=?]", "subscription_plan_feature[description]")
    end
  end
end
