##
## if some models fail to update records, this error will be thrown
##

class Major::UpdateFailedError < Major::BaseError
	
	###
	## public methods
	#

	def http_status
		:not_acceptable
	end
end