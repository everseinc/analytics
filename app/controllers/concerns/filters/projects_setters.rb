module Concerns::Filters::ProjectsSetters

	extend ActiveSupport::Concern

	###
	## included
	#

	included do


		###
		## add before filters
		#

    before_action :set_project, only: [:show, :edit]
    before_action :set_new_project_form, only: [:new]
		before_action :set_project_form, only: [:edit]



    ###
    ## filter method
    #

		def set_project
			@project = Project.find(params[:id])
		end

		def set_new_project_form
			@project_form = ProjectForm.new
		end

		def set_project_form()
			@project_form = ProjectForm.set(params[:id])
		end
	end
end