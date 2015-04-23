module Navigation
  class Item
    attr_reader :key, :name, :url, :options

    def initialize(key, name, url, options = {})
      self.options = options
      self.key  = key
      self.name = name
      self.url  = url
    end

    protected

    attr_writer :key, :name, :url, :options
  end
end
