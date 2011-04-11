module Forms::Fields
  class SelectField < Field
    include LabelledField
    include OptionedField
    include ActionView::Helpers::FormOptionsHelper

    property :label, String
    property :required, Boolean, :default => false

    def to_html(template)
      super { select_tag(name, options_for_select(options), :include_blank => "- #{label} -") }
    end
  end
end
