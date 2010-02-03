ActionController::Routing::Routes.draw do |map|
  map.namespace :spreedly do |spreedly|
    spreedly.users_update_changed "/users/update_changed/#{RSpreedly::Config.api_key}", :controller => :users, :action => :update_changed, :conditions => {:method => :post}
    spreedly.resources :feature_levels, :collection => [:gather] do |feature_levels|
      feature_levels.resources :attributes, :controller => 'feature_attributes'
    end
  end
end