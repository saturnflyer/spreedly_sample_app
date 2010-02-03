require 'spec_helper'

describe SubscriptionPlanFeature do
  before(:each) do
    @valid_attributes = {
      :feature_level => "value for feature_level",
      :name => "value for name",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    SubscriptionPlanFeature.create!(@valid_attributes)
  end
end
