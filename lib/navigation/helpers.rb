module Navigation
  module Helpers

    def self.load_config(options, includer)
      context = options.delete(:context)
      Navigation.init_context_from includer
      Navigation.load_config context
      Navigation::Configuration.eval_config context
      Navigation::Configuration.instance
    end

    def navigation_data(options = {})
      config = Navigation::Helpers.load_config options, self
      Navigation::Decorators::NavigationDecorator.new config
    end
  end
end
