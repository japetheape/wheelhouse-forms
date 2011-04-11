module Forms::Fields
  class ContentField < Field
    property :content, Translated[ActionView::OutputBuffer]
  
    def to_html(template)
      super { content.to_s }
    end
  end
end
