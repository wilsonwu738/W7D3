require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
# require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GoalApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.generators.system_tests = nil

    config.generators do |g|
      g.test_framework :rspec, # This line tells Rails to use RSpec for testing
        :fixtures => false, # Fixtures are rails default way of creating objects for testing, we'll do most of these ourselves
        :view_specs => false,
        :helper_specs => false,
        :routing_specs => false,
        :controller_specs => true, # Please note that I've set this line to true
        :request_specs => false
        g.fixture_replacement :factory_bot, :dir => "spec/factories"

        # All of the other false values tell Rails not to auto generate tests for those types of files. We'll do these manually, but as you grow your Rails knowledge, you may want to switch this to have the files generated for you.
        # When we talk about auto-generating, we're specifically referring to commands like 'rails g model' or 'rails g controller'. These commands will help us auto generate our models and controllers.
    end
  end
end
