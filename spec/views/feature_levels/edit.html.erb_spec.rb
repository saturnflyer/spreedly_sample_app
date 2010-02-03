require 'spec_helper'

describe "/feature_levels/edit.html.erb" do
  include FeatureLevelsHelper

  before(:each) do
    assigns[:feature_level] = @feature_level = stub_model(FeatureLevel,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders the edit feature_level form" do
    render

    response.should have_tag("form[action=#{feature_level_path(@feature_level)}][method=post]") do
      with_tag('input#feature_level_name[name=?]', "feature_level[name]")
      with_tag('textarea#feature_level_description[name=?]', "feature_level[description]")
    end
  end
end
