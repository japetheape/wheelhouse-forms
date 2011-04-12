class Forms::Mailer < ActionMailer::Base
  default :template_path => "form"
  
  def submission(form, submission)
    @form, @submission = form, submission
    
    mail(:from => "no-reply@#{form.site.domain}",
         :to => form.recipients,
         :subject => form.subject)
  end
end
