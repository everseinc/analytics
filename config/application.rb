require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Analytics
  class Application < Rails::Application

    ###
    ## environment settings
    #

    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja

    config.browserify_rails.commandline_options = '-t babelify'


  	###
  	## auto load settings
  	#

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  	config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
  	config.autoload_paths += %W(#{config.root}/app/exceptions/)



  end
end
