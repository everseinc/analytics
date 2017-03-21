class ProjectForm < ProjectDetails

	###
	## class method
	#

  class << self

  	###
		## login
		#

    def set(id)
      project = Project.find_by(id: id)
    end

		def save(new_project)
			ProjectDetails.save(new_project)
		end
    
	end
end