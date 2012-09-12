module Forms::Fields
  class TextArea < Field
    include LabelledField

    property :label, String
    property :required, Boolean, :default => false

    def to_html(template)
      super { text_area_tag(name, nil, html_options) }
    end
  end
end
