module NumberToYen
  class Railtie < Rails::Railtie
    initializer 'number_to_yen.configure_rails_initialization' do
      ActiveSupport.on_load(:action_view) do
        ActionView::Base.send(:include, ::NumberToYen)
      end
    end
  end
end
