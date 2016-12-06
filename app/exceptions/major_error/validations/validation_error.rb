##
## if some values are wrong, this error will be thrown
##

class MinorError::Validatoins::ValidationError < CustomError

	###
	## public methods
	#

	def http_status
		:not_acceptable
	end
end