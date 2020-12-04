require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GraphqlCacheTest
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.cache_store = :redis_cache_store
    config.graphql_fragment_cache.store = :redis_cache_store

    config.active_record.cache_versioning = true

    # IMPORTANT: this is required to include the updated at timestamp in the cache keys
    # https://github.com/rails/rails/blob/9b6008924d527b61b11677a78542a7b0fd4d80bf/activerecord/lib/active_record/relation.rb#L293
    config.active_record.collection_cache_versioning = false

    config.generators do |generator|
      # generator.test_framework :rspec, spec: true
      # generator.fixture_replacement :factory_bot
      generator.orm :active_record, primary_key_type: :uuid
    end
  end
end
