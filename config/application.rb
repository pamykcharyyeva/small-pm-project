require_relative 'boot'

require 'rails/all'
require "view_component/engine"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SmallPm
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end

  module RailsStdoutLogging
    class StdoutLogger < defined?(::ActiveSupport::Logger) ? ::ActiveSupport::Logger : ::Logger
      include ::LoggerSilence if defined?(::LoggerSilence)
    end
  
    class Rails
      def self.heroku_stdout_logger
        logger       = StdoutLogger.new(STDOUT)
        logger       = ActiveSupport::TaggedLogging.new(logger) if defined?(ActiveSupport::TaggedLogging)
        logger.level = StdoutLogger.const_get(log_level)
        logger
      end
  
      def self.log_level
        ([(ENV['LOG_LEVEL'] || ::Rails.application.config.log_level).to_s.upcase, "INFO"] & %w[DEBUG INFO WARN ERROR FATAL UNKNOWN]).compact.first
      end
  
      def self.set_logger
        STDOUT.sync = true
      end
    end
  end
  
end
