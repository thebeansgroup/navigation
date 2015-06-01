module Navigation
  class Item
    attr_reader :key, :name, :url, :options, :active

    def initialize(key, name, url, options = {})
      self.options = options
      self.key  = key
      self.name = name
      self.url  = url
      self.active = is_active?
    end

    def is_active?
      current_path_proc = Proc.new do
        request.path
      end
      current_path = Navigation.context.for_eval.instance_eval &current_path_proc

      current_path == self.url
    end

    protected

    attr_writer :key, :name, :url, :options, :active
  end
end
