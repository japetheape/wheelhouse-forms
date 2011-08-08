class Forms::FormsController < Wheelhouse::ResourceController
  self.resource_class = Forms::Form
  manage_site_breadcrumb
  
  def version
    resource.revert_to(params[:version].to_i)
    render :edit
  end
end
