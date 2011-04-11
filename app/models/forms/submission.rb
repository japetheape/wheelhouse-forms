class Forms::Submission < Wheelhouse::Resource
  property :params, Hash
  timestamps!
  
  belongs_to :form, :class => "Forms::Form"
  
  default_scope order(:created_at.desc)
  
  def value_for(field)
    params[field.label]
  end
  
  def admin_path
    forms_form_submission_path(form_id, id)
  end
end
