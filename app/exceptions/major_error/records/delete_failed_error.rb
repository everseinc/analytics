##
## if some models fail to delete records, this error will be thrown
##

class MinorError::Validatoins::DeleteFailedError < CustomError
	def http_status
		:not_acceptable
	end
end