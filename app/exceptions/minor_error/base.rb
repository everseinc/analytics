##
## an error for any minor missing in this application
##

class MinorError::Base < CustomError
	def http_status
  	:internal_server_error
	end
end