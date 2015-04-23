module Navigation
  class ItemGroup
    attr_reader :items

    def initialize
      self.items ||= BaseCollection.new
    end

    def item(key, name, url = nil, options = {})
      self.items[key] = Item.new(key, name, url, options)
      self.items
    end

    protected

    attr_writer :items
  end
end
