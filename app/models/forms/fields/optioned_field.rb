module Forms::Fields
  module OptionedField
    extend ActiveSupport::Concern
  
    include Wheelhouse::Admin::SafeOutputHelper
  
    included do
      property :options, MongoModel::Collection[String]
    end
  
    def options=(options)
      write_attribute(:options, options.reject(&:blank?))
    end

    def options(include_blank = false)
      read_attribute(:options) + (include_blank ? [""] : [])
    end
  end
end
