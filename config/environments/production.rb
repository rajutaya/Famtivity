Famtivity::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true
  config.action_mailer.default_url_options = { :host => 'http:\\localhost:3001' }

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = true

  # Compress JavaScripts and CSS
  config.assets.compress = false
  config.assets.js_compressor = :closure

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = true

  # Generate digests for assets URLs
  config.assets.digest = true
  # Defaults to nil and saved in location specified by config.assets.prefix
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]
  
  config.after_initialize do
    ActiveMerchant::Billing::Base.mode = :test
    ::GATEWAY = ActiveMerchant::Billing::AuthorizeNetGateway.new(
      :login => "3Rp74CQw2P",
      :password => "88Br2z8z6JuSY4QJ"
    )

    ::CIMGATEWAY = ActiveMerchant::Billing::AuthorizeNetCimGateway.new(
      :login => "3Rp74CQw2P",
      :password => "88Br2z8z6JuSY4QJ"
    )

    FB_APP_ID = '347402855386155'
    end
    
Paperclip.options[:command_path] = 'C:/PROGRA~1/IMAGEM~1.0-Q'

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
   config.action_controller.asset_host = "http://localhost:3001"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
   config.assets.precompile += %w( *.js *.css )

  # Disable delivery errors, bad email addresses will be ignored
  config.action_mailer.raise_delivery_errors = true

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
  
  ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,  #this is the important shit!
    :address        => 'smtp.gmail.com',
    :port           => 587,
    :domain         => 'www.gmail.com',
    :authentication => :plain,
    :user_name      => 'support@famtivity.com',
    :password       => 'F@msupp0rT'
  }

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # config.active_record.auto_explain_threshold_in_seconds = 0.5
end