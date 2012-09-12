module Forms::Fields
  class TextField < Field
    include LabelledField

    property :label, String
    property :required, Boolean, :default => false

    def to_html(template)
      super { text_field_tag(name, nil, html_options) }
    end
  end
end
