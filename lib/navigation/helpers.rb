module Navigation
  module Helpers

    def self.load_config(options, includer)
      context = options.delete(:context)
      Navigation.init_context_from includer
      Navigation.load_config context
      Navigation::Configuration.eval_config context
    end

    def navigation_data(options = {})
      Navigation::Helpers.load_config options, self
    end
  end
end
