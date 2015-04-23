require 'singleton'

module Navigation
  class Configuration
    include Singleton

    attr_reader :item_groups, :items, :options

    def initialize
      @options = Options.new
      @items = ItemGroupCollection.new
      @item_groups = ItemGroupCollection.new
    end

    # Starts processing the configuration
    def self.setup(&block)
      block.call Configuration.instance
    end

    def self.eval_config(context)
      config = Navigation.config
      Navigation.context.for_eval.instance_eval config
    end

    def item(key, name, url, options = {})
      add_item key, Item.new(key, name, url, options)
    end

    def option(key, value = nil, &block)
      return add_option key, block.call if block_given?
      add_option key, value
    end

    def item_group(key, &block)
      add_item_group key, block.call(ItemGroup.new)
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
