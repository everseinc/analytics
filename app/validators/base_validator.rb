##
## a class for base validations
##

class BaseValidator

	###
	## class methods
	#

	def self.validate(&condition)
		-> (value, monad) {
			return monad.zero unless condition.call(value)
			monad.new(value)
		}
	end
end