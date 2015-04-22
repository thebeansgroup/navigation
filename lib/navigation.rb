require "navigation/version"
require 'navigation/railtie'
require 'navigation/configuration'
require 'navigation/item_collection'
require 'navigation/item'
require 'navigation/helpers'
require 'navigation/context'

module Navigation

  mattr_accessor :config, :root, :environment, :context

  # Cache for loaded config files
  self.config = nil

  class << self
    # Sets the root path and current environment as specified. Also sets the
    # default config_file_path.
    def set_env(root, environment)
      self.root = root
      self.environment = environment
    end

    def init_context_from(includer)
      self.context = Navigation::Context.new includer
    end

    def load_config(navigation_context = :global)
      self.config ||= read_config
    end

    def read_config
      File.read config_file
    end

    def config_file
      File.join(Rails.root, 'config', 'navigation.rb')
    end
  end
end
