class Spreedly::UsersController < ApplicationController
  def update_changed
    respond_to do |format|
      format.xml {
        subscriber_ids = (params[:subscriber_ids] || '').split(",")
        subscriber_ids.each do | each |
          user = User.find_by_id(each)
          user.refresh_from_spreedly if user
        end
        head(:ok)
      }
    end
  end
end