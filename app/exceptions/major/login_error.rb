##
## if syou fail to login, this error will be thrown
##

class Major::LoginError < Major::BaseError 

	###
	## public methods
	#

	def http_status
		:not_acceptable
	end
end