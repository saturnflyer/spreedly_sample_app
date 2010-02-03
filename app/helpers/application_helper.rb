# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def greeting
    greet = "Welcome"
    greet << ' back' if current_user.login_count.to_i >= 1
    greet << ", #{current_user.display_name(:short => true)}" 
  end
end
