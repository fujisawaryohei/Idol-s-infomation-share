require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module IdolShare
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators do |g|
      g.javascripts false
      g.helper false
      g.test_framework false
    end
    # Don't generate system test files.
    config.generators.system_tests = nil
    config.generators do |generator|
      generator.orm :active_record, primary_key_type: :integer
    end
  end
end
