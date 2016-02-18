module Navigation
  class Context
    attr_reader :controller, :template, :request

    def initialize(context)
      self.controller = extract_controller_from(context)
      self.template = template_from(controller)
      self.request = template.try(:request)
    end

    # Extracts a controller from the context.
    def extract_controller_from(context)
      if context.respond_to?(:controller)
        context.controller || context
      else
        context
      end
    end

    def template_from(_controller)
      if self.controller.respond_to?(:view_context)
        self.controller.view_context
      else
        self.controller.instance_variable_get(:template)
      end
    end

    def for_eval
      template ||
        controller ||
        fail('no context set for evaluating the config file')
    end

    private

    attr_writer :controller, :template, :request
  end
end
