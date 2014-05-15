module AsyncRequireRails
  class Railtie < Rails::Railtie
    initializer "railtie.configure_rails_initialization" do |app|
      app.middleware.use Middleware
    end
  end
end
