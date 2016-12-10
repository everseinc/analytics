##
## an error for any major missing in this application
##

class Major::BaseError < CustomError
	
	###
	## public methods
	#

	def http_status
  	:bad_request
	end
end