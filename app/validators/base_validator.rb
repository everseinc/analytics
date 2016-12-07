##
## a class for base validations
##

class BaseValidator

	###
	## class methods
	#

	# a string lentgh must be under max
	def self.validate(&condition)
		-> (value, monad) {
			return monad.zero unless condition.call(value)
			monad.new(value)
		}
	end
end