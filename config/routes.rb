ActionController::Routing::Routes.draw do |map|

  map.sign_out "/sign-out", :controller => "user_sessions", :action => "destroy"
  map.sign_in "/sign-in", :controller => "user_sessions", :action => "new"
  map.sign_up "/sign-up", :controller => "users", :action => "new"

  map.resources :users

  map.resource :account, :controller => "users"
  map.resource :user_session
  
  map.root :controller => 'users', :action => 'new'
end
