##
## if some models fail to delete records, this error will be thrown
##

class Major::DeleteFailedError < Major::BaseError
	
	###
	## public methods
	#

	def http_status
		:not_acceptable
	end
end