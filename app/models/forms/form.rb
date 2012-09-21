class Forms::Form < Wheelhouse::Resource
  include Wheelhouse::Resource::Node
  include Wheelhouse::Resource::Renderable
  include Wheelhouse::Resource::Addressable
  include Wheelhouse::Resource::Versioned
  include Wheelhouse::Resource::Content
  
  property :title, String, :required => true, :translate => true
  property :fields, FieldCollection, :default => [Forms::Fields::FieldSet.new]
  property :recipients, MongoModel::Collection[String]
  property :subject, String, :default => "Form Submission"
  
  has_many :submissions, :class => "Forms::Submission"
  
  activities :all
  
  icon "wheelhouse-forms/form.png"
  
  include ActionView::Helpers::FormTagHelper
  attr_accessor :output_buffer, :context
  
  def to_s
    render(context)
  end
  
  def render(template)
    form_tag(path) do
      fields.to_html(template) + content_tag(:div, submit_tag(I18n.t("Submit")), :class => "submit")
    end
  end
  
  def submit(params)
    submissions.build(:params => params) do |submission|
      submission.save!
      deliver(submission)
    end
    
    @success = true
  end
  
  def deliver(submission)
    Forms::Mailer.submission(self, submission).deliver unless recipients.empty?
  rescue
    # Mail delivery failed
  end
  
  def success?
    @success
  end
  
  def errors?
    false
  end
  
  def first_content_field
    @first_content_field ||= begin
      result = fields.first
      result = result.fields.first if result.is_a?(Forms::Fields::FieldSet)
      result
    end
  end
  
  def recipients_string
    recipients.join(', ')
  end
  
  def recipients_string=(recipients)
    self.recipients = recipients.split(/,/).map(&:strip)
  end
  
  def handler
    Forms::FormHandler
  end
  
  def protect_against_forgery?
    false
  end
  
  def controller
  end
end
