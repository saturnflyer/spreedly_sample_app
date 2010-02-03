require 'spec_helper'

describe "/feature_attributes/show.html.erb" do
  include FeatureAttributesHelper
  before(:each) do
    assigns[:feature_attribute] = @feature_attribute = stub_model(FeatureAttribute,
      :name => "value for name",
      :description => "value for description",
      :feature_level_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/1/)
  end
end
