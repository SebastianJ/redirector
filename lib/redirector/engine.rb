module Redirector
  class Engine < ::Rails::Engine
    config.redirector = ActiveSupport::OrderedOptions.new

    initializer "redirector.add_middleware", after: 'build_middleware_stack' do |app|
      if app.config.redirector.middleware_installation && app.config.redirector.middleware_installation.respond_to?(:call)
        app.config.redirector.middleware_installation.call
      else
        app.middleware.insert_before(Rack::Runtime, Redirector::Middleware)
      end
    end

    initializer "redirector.apply_options" do |app|
      Redirector.current_site            = app.config.redirector.current_site
      Redirector.include_query_in_source = app.config.redirector.include_query_in_source || false
      Redirector.preserve_query          = app.config.redirector.preserve_query || false
      Redirector.silence_sql_logs        = app.config.redirector.silence_sql_logs || false
      Redirector.ignored_patterns        = app.config.redirector.ignored_patterns || []
    end
  end
end
