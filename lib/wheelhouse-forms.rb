require "wheelhouse"

module Forms
  class Plugin < Wheelhouse::Plugin
    isolate_namespace Forms
    
    resource { Form }
    
    initializer :add_mailer_template_paths do
      Forms::Mailer.prepend_view_path(paths["app/templates"].existent.to_a)
    end
    
    initializer :precompile_assets do |app|
      app.config.assets.precompile += %w(wheelhouse-forms/admin.*)
    end
  end
end
