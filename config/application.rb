require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Analytics
  class Application < Rails::Application

  	##
  	## auto load settings
  	##

  	config.autoload_paths += %W(#{config.root}/lib)
  	config.autoload_paths += %W(#{config.root}/app/exceptions)
  end
end
