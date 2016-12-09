##
## if some models fail to save records, this error will be thrown
##

class Major::SaveFailedError < Major::BaseError
	
	###
	## public methods
	#

	def http_status
		:not_acceptable
	end
end