class ProjectsController < ApplicationController

	###
	## resources actions
	#

	def index
  end

  def new
    @project_form = ProjectForm.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
  	res = postConnectTo(klass: ProjectForm, func: "save", args: project_form_params)
    if res
      redirect_to project_path(res)
    else
    	@project_form = ProjectForm.new
      render :action => 'new'
    end
  end


  ###
  ## strong parameters
	#

	private

	def project_form_params
		params[:project_form].permit(:project_name, :app_id)
	end
end