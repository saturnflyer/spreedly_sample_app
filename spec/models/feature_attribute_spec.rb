require 'spec_helper'

describe FeatureAttribute do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :feature_level_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    FeatureAttribute.create!(@valid_attributes)
  end
end
