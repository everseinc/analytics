class SessionForm

	extend SessionManager

	###
	## class method
	#

  class << self

  	###
		## login
		#

		def login(session_params)

			customer = Either.right(session_params) >>
			  				 					email_not_empty >>
			  				 					find_user >>
			  				 					authenticate(session_params) >>
			  				 					login_by_id

			raise condition.left if condition.left?
		end
	end
end