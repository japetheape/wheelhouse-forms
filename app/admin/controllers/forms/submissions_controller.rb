class Forms::SubmissionsController < Wheelhouse::ResourceController
  belongs_to :form, :class_name => Forms::Form
  self.resource_class = Forms::Submission
  
  breadcrumb { ["Site Overview", wheelhouse_site_url] }
  breadcrumb { [parent.label, parent] }
  
  actions :show, :destroy
  
  respond_to :csv
  
  def index
    respond_with(parent) do |format|
      format.csv { render :text => Forms::Form.to_csv }
    end
  end
end
