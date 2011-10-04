require 'sandra'
require 'rails'
require 'active_model/railtie'

require 'action_controller/railtie'

module Rails
  module Sandra

    class Railtie < Rails::Railtie
      config.app_generators.orm = :sandra
    end
  end
end
