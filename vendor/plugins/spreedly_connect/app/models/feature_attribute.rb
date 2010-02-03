class FeatureAttribute < ActiveRecord::Base
  belongs_to :feature_level
  validates_presence_of :name
end
