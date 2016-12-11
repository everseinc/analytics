##
## if some values are wrong, this error will be thrown
##

class Major::ValidationError < Major::BaseError

	###
	## public methods
	#

	def http_status
		:not_acceptable
	end
end