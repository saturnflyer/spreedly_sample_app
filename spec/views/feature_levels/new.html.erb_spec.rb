require 'spec_helper'

describe "/feature_levels/new.html.erb" do
  include FeatureLevelsHelper

  before(:each) do
    assigns[:feature_level] = stub_model(FeatureLevel,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders new feature_level form" do
    render

    response.should have_tag("form[action=?][method=post]", feature_levels_path) do
      with_tag("input#feature_level_name[name=?]", "feature_level[name]")
      with_tag("textarea#feature_level_description[name=?]", "feature_level[description]")
    end
  end
end
