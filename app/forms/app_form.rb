class AppForm < AppDetails

	###
	## class method
	#

  class << self

  	###
		## login
		#

		def save(new_app)
			AppDetails.save(new_app)
		end
	end
end