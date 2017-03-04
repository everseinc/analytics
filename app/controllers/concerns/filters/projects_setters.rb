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
    before_action :set_project_form, only: [:new]


    ###
    ## filter method
    #

		def set_project
			@project = Project.find(params[:id])
		end

		def set_project_form
			@project_form = ProjectForm.new
		end
	end
end