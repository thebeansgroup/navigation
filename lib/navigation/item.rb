module Navigation
  class Item
    attr_reader :key, :name, :url

    def initialize(key, name, url)
      self.key  = key
      self.name = name
      self.url  = url
    end

    protected

    attr_writer :key, :name, :url
  end
end
