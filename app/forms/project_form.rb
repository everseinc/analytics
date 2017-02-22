class ProjectForm < ProjectDetails
  include ActiveModel::Model

	###
	## class method
	#

  class << self

  	###
		## login
		#

		def save(new_project)
			ProjectDetails.save(new_project)
		end
	end
end