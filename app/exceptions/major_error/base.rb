##
## an error for any major missing in this application
##

class MajorError::Base < CustomError
	
	###
	## public methods
	#

	def http_status
  	:bad_request
	end
end