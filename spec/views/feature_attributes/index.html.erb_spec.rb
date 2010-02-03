require 'spec_helper'

describe "/feature_attributes/index.html.erb" do
  include FeatureAttributesHelper

  before(:each) do
    assigns[:feature_attributes] = [
      stub_model(FeatureAttribute,
        :name => "value for name",
        :description => "value for description",
        :feature_level_id => 1
      ),
      stub_model(FeatureAttribute,
        :name => "value for name",
        :description => "value for description",
        :feature_level_id => 1
      )
    ]
  end

  it "renders a list of feature_attributes" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
