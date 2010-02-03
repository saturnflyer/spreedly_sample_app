require 'spec_helper'

describe "/feature_attributes/new.html.erb" do
  include FeatureAttributesHelper

  before(:each) do
    assigns[:feature_attribute] = stub_model(FeatureAttribute,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description",
      :feature_level_id => 1
    )
  end

  it "renders new feature_attribute form" do
    render

    response.should have_tag("form[action=?][method=post]", feature_attributes_path) do
      with_tag("input#feature_attribute_name[name=?]", "feature_attribute[name]")
      with_tag("textarea#feature_attribute_description[name=?]", "feature_attribute[description]")
      with_tag("input#feature_attribute_feature_level_id[name=?]", "feature_attribute[feature_level_id]")
    end
  end
end
