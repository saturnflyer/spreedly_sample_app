require 'spec_helper'

describe "/feature_levels/show.html.erb" do
  include FeatureLevelsHelper
  before(:each) do
    assigns[:feature_level] = @feature_level = stub_model(FeatureLevel,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
  end
end
