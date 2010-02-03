require 'spec_helper'

describe "/feature_levels/index.html.erb" do
  include FeatureLevelsHelper

  before(:each) do
    assigns[:feature_levels] = [
      stub_model(FeatureLevel,
        :name => "value for name",
        :description => "value for description"
      ),
      stub_model(FeatureLevel,
        :name => "value for name",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of feature_levels" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
