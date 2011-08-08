class Forms::Submission < Wheelhouse::BasicResource
  include Wheelhouse::Resource::AdminPath
  
  property :params, Hash
  timestamps!
  
  belongs_to :form, :class => "Forms::Form"
  
  default_scope order(:created_at.desc)
  
  def value_for(field)
    params[field.label]
  end
  
  def admin_path
    form_submission_path(form_id, id)
  end
  
  def admin_url
    form_submission_url(form, id, :host => form.site.domain)
  end
end
