module Navigation
  class ItemCollection
    attr_reader :items

    def initialize
      @items ||= []
    end

    def item(key, name, url = nil)
      item = Item.new(key, name, url)
      self.items << item
    end

    protected

    attr_writer :items
  end
end
