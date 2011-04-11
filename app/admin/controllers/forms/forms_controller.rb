class Forms::FormsController < Wheelhouse::ResourceController
  self.resource_class = Forms::Form
  breadcrumb { ["Site Overview", wheelhouse_site_url] }
  
  def version
    resource.revert_to(params[:version].to_i)
    render :edit
  end
end
