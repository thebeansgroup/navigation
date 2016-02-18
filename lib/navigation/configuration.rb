require 'singleton'

module Navigation
  class Configuration
    attr_reader :item_groups, :items, :options

    def initialize
      @options = Navigation::Options.new
      @items = Navigation::ItemGroupCollection.new
      @item_groups = Navigation::ItemGroupCollection.new
    end

    # Starts processing the configuration
    def self.setup(&block)
      config = new
      block.call config
      config
    end

    def self.eval_config(context)
      config = Navigation.config_for_context(context)
      Navigation.context.for_eval.instance_eval config
    end

    def item(key, name, url, options = {})
      add_item key, Navigation::Item.new(key, name, url, options)
    end

    def option(key, value = nil, &block)
      return add_option key, block.call if block_given?
      add_option key, value
    end

    def item_group(key, &block)
      add_item_group key, block.call(Navigation::ItemGroup.new)
    end

    protected

    def add_option(key, value)
      @options[key] = value
    end

    def add_item(key, item)
      @items[key] = item
    end

    def add_item_group(key, item_group)
      @item_groups[key] = item_group
    end

    private

    attr_writer :item_groups, :items, :options
  end
end
