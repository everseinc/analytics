##
## a class for validations of Number
##

class NumberValidator < BaseValidator

	###
	## class methods
	#

	# a number must not be zero
	def self.not_zero
		condition = -> (number) { number != 0 }
		either_validate(21001, &condition)
	end

	# a number must be above zero
	def self.above_zero
		condition = -> (number) { number > 0 }
		either_validate(21001, &condition)
	end

	# a number must be above target
	def self.above(target)
		condition = -> (number) { number > target }
		either_validate(21001, &condition)
	end

	# a number must be under zero
	def self.under_zero
		condition = -> (number) { number < 0 }
		either_validate(21001, &condition)
	end

	# a number must be under target
	def self.under(target)
		condition = -> (number) { number < target }
		either_validate(21001, &condition)
	end

	# a number must be even number
	def self.even
		condition = -> (number) { number % 2 == 1 }
		either_validate(21001, &condition)
	end

	# a number must be odd number
	def self.odd
		condition = -> (number) { number % 2 == 0 }
		either_validate(21001, &condition)
	end

	# a number must be divisible by target
	def self.divisible_by(target)
		condition = -> (number) { number % target == 0 }
		either_validate(21001, &condition)
	end
end