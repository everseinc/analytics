class CustomerForm < CustomerDetails

	extend SessionManager

	###
	## class method
	#

  class << self

  	###
		## login
		#

		def save(new_customer)
			CustomerDetails.save(new_customer)
		end
	end

end