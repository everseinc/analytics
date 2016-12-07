##
## a class for base validations
##

class BaseValidator

	###
	## class methods
	#

	# a string lentgh must be under max
	def self.validate(&condtion)
		-> (value, monad) {
			return monad.zero unless condtion.call(value)
			monad.new(value)
		}
	end
end