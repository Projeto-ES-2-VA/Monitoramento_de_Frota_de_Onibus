require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Cucumber configuration
  config.annotations.register_directories('features')
  config.annotations.register_extensions('feature') { |tag| /#\s*(#{tag}):?\s*(.*)$/ }

  # Hosts
  config.hosts << "katchau-production-1521.up.railway.app"

  # Development settings
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true

  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # Active Storage settings
  config.active_storage.service = :local

  # Mailer settings
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false

  # Logging and deprecation settings
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true

  # Asset settings
  config.assets.quiet = true

  # I18n settings
  # config.i18n.raise_on_missing_translations = true

  # View settings
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true
end