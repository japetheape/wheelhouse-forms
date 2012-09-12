module Forms::Fields
  class Checkbox < Field
    property :label, String
    property :required, Boolean, :default => false

    def to_html(template)
      super do
        label_tag { check_box_tag(name, "1", false, html_options) + " " + label }
      end
    end

    def reference
      label
    end
  end
end
