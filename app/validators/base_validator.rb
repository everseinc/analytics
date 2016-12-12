##
## a class for base validations
##

class BaseValidator

	###
	## class methods
	#

	# for Either class
	def self.either_validate(code, &condition)
		-> (value, monad) {
			return monad.left Major::BaseError.code(code) unless condition.call(value)
			monad.right(value)
		}
	end

	# for Maybe class
	def self.maybe_validate(&condition)
		-> (value, monad) {
			return monad.zero unless condition.call(value)
			monad.new(value)
		}
	end
end