module Forms::Fields
  class Field < Wheelhouse::EmbeddedResource
    include ActionView::Helpers::FormTagHelper
    attr_accessor :output_buffer

    def self.partial
      name.demodulize.underscore
    end

    def self.field_class
      partial.dasherize
    end

    delegate :field_class, :to => "self.class"

    def to_html(template)
      content_tag(:div, :class => classes.join(" ")) { yield if block_given? }
    end

    def name
      "submission[#{reference}]"
    end

  protected
    def classes
      ["field"].tap do |classes|
        classes << field_class
        classes << "required" if respond_to?(:required?) && required?
        classes << reference.parameterize if respond_to?(:reference)
      end
    end
  end
end
