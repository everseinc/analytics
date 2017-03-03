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
			customer = CustomerDetails.save(new_customer)
			if customer.valid?
				login(customer)
			end
		end
	end

end