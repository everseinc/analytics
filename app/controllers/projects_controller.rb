class ProjectsController < ApplicationController

  include Concerns::Resources::ProjectsResources
  include Concerns::Filters::ProjectsSetters
  include Concerns::Filters::AuthAction

  ###
  ## POST
  #

  def create
  	res = postConnectTo(klass: ProjectForm, func: "save", args: project_form_params)
    if res
      redirect_to project_path(res)
    else
      redirect_to :action => 'new'
    end
  end

  def update
    res = postConnectTo(klass: Project, func: "update_name", args: project_params)
    if res
      redirect_to project_path(res)
    else
      redirect_to :action => 'edit'
    end
  end


  ###
  ## strong parameters
	#

	private

	def project_form_params
		params[:project_form].permit(:project_name, :app_id)
	end

  def project_params
    params[:project].permit(:id, :project_name)
  end
end