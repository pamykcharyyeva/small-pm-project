Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  # bring back this in case needed
  # config.session_store :cache_store
  # was changed from obove to this due to reason, I needed to uploud it to heroku live
  config.session_store :cache_store, key: "small_pm_development", compress: true, pool_size: 5, expire_after: 1.year
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
# bring back this, in case needed
    # config.cache_store = :memory_store
    # config.public_file_server.headers = {
    #   'Cache-Control' => "public, max-age=#{2.days.to_i}"
    # }
    # changed obove to below one, due to reason to uploud this app live to heroku
    config.cache_store = :redis_cache_store, {driver: :hiredis, url: ENV.fetch("HEROKU_REDIS_GREY_URL") { "redis://localhost:6379/1" }}
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
end
