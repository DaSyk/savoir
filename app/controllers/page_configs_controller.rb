class PageConfigsController < ApplicationController
  before_action :authenticate_admin!
  respond_to :html


 def edit
   @page_config = PageConfig.first
 end

 def update
    @page_config = PageConfig.first
    @page_config.update(page_config_params)
    flash[:notice] = "Die Änderungen wurden gespeichert!"
    redirect_to houses_path
  end

  private
   def page_config_params
      params.require(:page_config).permit(:id, pages_attributes: [:id, :page_config_id, :content])
   end
end
