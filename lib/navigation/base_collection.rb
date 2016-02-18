module Navigation
  class BaseCollection < Hash
    def []=(key, val)
      define_item_group_getter(key)
      super(key, val)
    end

    protected

    def define_item_group_getter(key)
      return if metaclass.instance_methods.include?(key)
      metaclass.send :define_method, key do
        fetch(key)
      end
    end

    def metaclass
      class << self
        self
      end
    end
  end
end
