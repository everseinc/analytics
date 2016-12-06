##
## if some values are wrong, this error will be thrown
##

class MinorError::Validatoins::ValidationError < CustomError
	def http_status
		:not_acceptable
	end
end