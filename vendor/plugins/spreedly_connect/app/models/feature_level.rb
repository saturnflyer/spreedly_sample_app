class FeatureLevel < ActiveRecord::Base
  has_many :feature_attributes
  validates_presence_of :name
end
