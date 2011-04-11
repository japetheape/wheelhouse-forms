class Forms::FieldCollection < MongoModel::Collection[Forms::Fields::Field]
  include Wheelhouse::Admin::SafeOutputHelper
  
  def to_html(template)
    safe_join(map { |field| field.to_html(template) })
  end
  
  def map_with_index
    result = []
    each_with_index { |item, index| result[index] = yield(item, index) }
    result
  end
  
  def self.mongomodel_accessors(property)
    Module.new do
      define_method("#{property.name}=") do |attrs|
        case attrs
        when Hash
          self.fields = attrs.sort { |(a, _), (b, _)| a.to_i <=> b.to_i }.map { |_, field_attrs|
            type = field_attrs.delete(:type).constantize
            type.new(field_attrs)
          }
        else
          write_attribute(property.name, attrs)
        end
      end
    end
  end
end
