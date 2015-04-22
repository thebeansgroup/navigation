require 'singleton'

module Navigation
  class Configuration
    include Singleton

    attr_reader :navigation

    # Starts processing the configuration
    def self.setup(&block)
      block.call Configuration.instance
    end

    def self.eval_config(context)
      config = Navigation.config
      Navigation.context.for_eval.instance_eval config
    end

    def items(&block)
      self.navigation = ItemCollection.new
      block.call navigation
    end

    private

    attr_writer :navigation
  end
end
