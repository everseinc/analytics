class CustomPointsForm < CustomPointsDetails
  attr_accessor :formula, :name, :app_id
	###
	## class method
	#

  class << self

  	###
		## login
		#

		def save(new_custom_point)
			CustomPointsDetails.save(new_custom_point)
		end
	end
end