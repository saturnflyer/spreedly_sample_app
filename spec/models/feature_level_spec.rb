require 'spec_helper'

describe FeatureLevel do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    FeatureLevel.create!(@valid_attributes)
  end
end
