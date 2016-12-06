##
## if some models fail to save records, this error will be thrown
##

class MinorError::Validatoins::SaveFailedError < CustomError
	def http_status
		:not_acceptable
	end
end