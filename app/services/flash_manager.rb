##
## a class for managing flash
##

class FlashManager

	###
	## accessor
	#

	attr_accessor :flash


	###
	## initializer
	#

	def initialize(hash)
		raise MustOverrideError.code(10000) unless hash.kind_of?(Hash)

		@flash = Maybe.new(hash)
  end


  ###
  ## public functions
  #

	def set_flash(hash)
		@flash = :merge.to_proc.curry(2) <= @flash > Maybe.new(hash)
	end
end