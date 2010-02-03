class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.logged_in_timeout = 10.minutes # default is 10.minutes
    c.require_password_confirmation = false 
  end
  
  attr_accessor :subscription_record, :subscription_plan, :requested_feature_level
  
  def display_name(opts = {})
    opts.symbolize_keys!
    if opts[:short] && subscription_record
      name = subscription_record.billing_first_name
      name = subscription_record.screen_name if name.blank?
      name = email if name.blank?
      return name
    elsif subscription_record
      record_names = [subscription_record.billing_first_name, subscription_record.billing_last_name]
      record_names = record_names.join(' ')
      if record_names.blank?
        subscription_record.screen_name
      else
        record_names
      end
    else
      email
    end
  end
  
  def upgrade_url(plan)
    if subscription_record && subscription_record.token
      "https://spreedly.com/#{RSpreedly::Config.site_name}/subscribers/#{id}/#{subscription_record.token}/subscribe/#{plan.id}"
    else
      "https://spreedly.com/#{RSpreedly::Config.site_name}/subscribers/#{id}/subscribe/#{plan.id}/#{email}"
    end
  end
  
  def subcription_account_url
    if subscription_record
      "https://spreedly.com/#{RSpreedly::Config.site_name}/subscriber_accounts/#{subscription_record.token}"
    else
      ""
    end
  end
  
  def refresh_from_spreedly
    update_attributes(:active_subscription => subscription_record.active)
  end
  
  def subscription_record
    @subscription_record ||= RSpreedly::Subscriber.find(id)
  end
end