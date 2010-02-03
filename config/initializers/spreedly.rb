RSpreedly::Config.setup do |config|
  config.api_key        = ENV['SPREEDLY_API_TOKEN'] || 'yourapitoken'
  config.site_name      = ENV['SPREEDLY_SITE_NAME'] || 'yoursitepath'
end