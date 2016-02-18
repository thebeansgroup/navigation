require 'navigation/version'
require 'navigation/railtie'
require 'navigation/configuration'
require 'navigation/base_collection'
require 'navigation/item_group_collection'
require 'navigation/item_group'
require 'navigation/item'
require 'navigation/options'
require 'navigation/helpers'
require 'navigation/context'
require 'navigation/decorators/navigation_decorator'

module Navigation
  mattr_accessor :config, :root, :environment, :context

  # Cache for loaded config files
  self.config = {}

  class << self
    # Sets the root path and current environment as specified. Also sets the
    # default config_file_path.
    def set_env(root, environment)
      self.root = root
      self.environment = environment
    end

    def config_for_context(context)
      config[context]
    end

    def init_context_from(includer)
      self.context = Navigation::Context.new(includer)
    end

    def load_config(context = :global)
      config[context] ||= read_config(context)
    end

    def read_config(context)
      File.read(config_file(context))
    end

    def config_file(context)
      File.join(Rails.root, 'config', "#{context}_navigation.rb")
    end
  end
end
