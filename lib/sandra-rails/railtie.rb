require 'sandra'
require 'rails'
require 'active_model/railtie'

require 'action_controller/railtie'

module Rails
  module Sandra

    class Railtie < Rails::Railtie
      rake_tasks do
        Dir[File.join(File.dirname(__FILE__),'tasks/*.rake')].each { |f| load f }
      end
      config.app_generators.orm = :sandra
    end
  end
end
