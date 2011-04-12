require "wheelhouse"

module Forms
  class Plugin < Wheelhouse::Plugin
    resource { Form }
    
    initializer :add_mailer_template_paths do
      Forms::Mailer.prepend_view_path(paths.app.templates.to_a)
    end
  end
end
