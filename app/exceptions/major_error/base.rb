##
## an error for any major missing in this application
##

class MajorError::Base < StandardError
	def http_status
  	:bad_request
	end
end