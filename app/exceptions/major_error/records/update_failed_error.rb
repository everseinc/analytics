##
## if some models fail to update records, this error will be thrown
##

class MinorError::Validatoins::UpdateFailedError < CustomError
	
	###
	## public methods
	#

	def http_status
		:not_acceptable
	end
end