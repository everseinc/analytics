class CustomPointsForm < CustomPointsDetails
  attr_accessor :formula, :name, :config_id

  def initialeze(config_id:)
    @config_id = config_id
  end


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