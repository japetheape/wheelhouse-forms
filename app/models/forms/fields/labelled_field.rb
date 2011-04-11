module Forms::Fields
  module LabelledField
    def to_html(template)
      super do
        result = ActiveSupport::SafeBuffer.new
        result << label_tag(name, label.html_safe) if label?
        result << yield if block_given?
        result
      end
    end

    def reference
      label
    end
  end
end
