##
## an error for any fatal missing in this application
##

class FatalError::Base < CustomError
	
	###
	## public methods
	#

	def http_status
  	:internal_server_error
	end
end