class Forms::FieldCollection < MongoModel::Collection[Forms::Fields::Field]
  include ActionView::Helpers::OutputSafetyHelper
  
  def to_html(template)
    safe_join(map { |field| field.to_html(template) })
  end
  
  def map_with_index
    result = []
    each_with_index { |item, index| result[index] = yield(item, index) }
    result
  end
  
  def self.cast(collection)
    case collection
    when Hash
      sorted_attrs = collection.sort { |(a, _), (b, _)| a.to_i <=> b.to_i }.map { |_, attrs| attrs }
      super(sorted_attrs)
    else
      super
    end
  end
end
