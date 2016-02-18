module Navigation
  class Railtie < Rails::Railtie
    initializer 'navigation.load_helpers' do
      ActionView::Base.send :include, Navigation::Helpers
      ActionController::Base.send :include, Navigation::Helpers
      Navigation.set_env(::Rails.root, ::Rails.env)
    end
  end
end
