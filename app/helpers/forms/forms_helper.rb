module Forms::FormsHelper
  def render_fields(fields, prefix)
    fields.map_with_index do |field, index|
      render(:partial => field.class.partial, :object => field, :locals => { :index => index, :prefix => "#{prefix}[#{index}]", :id => "" })
    end.join("\n").html_safe
  end
  
  def field_template(id, klass)
    jquery_template_tag(id) do
      render :partial => klass.partial, :object => klass.new, :locals => { :index => "${index}", :prefix => "${prefix}", :id => "${id}" }
    end
  end
  
  def basic_field(object, options={})
    render :partial => "basic_field",
           :object => object,
           :locals => {
                        :id => options[:id],
                        :prefix => options[:prefix],
                        :index => options[:index],
                        :type => options[:type],
                        :description => options[:description],
                        :icon => options[:icon] || options[:type]
                      }
  end
end
