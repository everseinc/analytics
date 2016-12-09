##
## a class for validations of String
##

class StringValidator < BaseValidator

	###
	## class methods
	#

	# a string must not be empty
	def self.not_empty
		condition = -> (string) { not string.empty? }
		validate(&condition)
	end

	# a string lentgh must be under max
	def self.length_under(max)
		condition = -> (string) { string.lentgh >= max }
		validate(&condition)
	end

	# a string lentgh must be above max
	def self.length_above(min)
		condition = -> (string) { string.lentgh <= min }
		validate(&condition)
	end

	# a string must be equal to given string
	def self.equel_to(target)
		condition = -> (string) { string == target }
		validate(&condition)
	end

	# a string format must be email
	def self.email_format
		condition = -> (string) { RegularExpressionManager::is_email?(string) }
		validate(&condition)
	end

	# a string format must be URL
	def self.url_format
		condition = -> (string) { RegularExpressionManager::is_url?(string) }
		validate(&condition)
	end

	# a string must contain only numbers
	def self.only_number
		condition = -> (string) { RegularExpressionManager::only_number?(string) }
		validate(&condition)
	end

	# a string must not contain any numbers
	def self.no_number
		condition = -> (string) { RegularExpressionManager::no_number?(string) }
		validate(&condition)
	end

	# a string must contain only lowercases
	def self.only_lower
		condition = -> (string) { RegularExpressionManager::only_lower?(string) }
		validate(&condition)
	end

	# a string must not contain any lowercases
	def self.no_lower
		condition = -> (string) { RegularExpressionManager::no_lower?(string) }
		validate(&condition)
	end

	# a string must contain only uppercases
	def self.only_upper
		condition = -> (string) { RegularExpressionManager::only_upper?(string) }
		validate(&condition)
	end

	# a string must not contain any uppercases
	def self.no_upper
		condition = -> (string) { RegularExpressionManager::no_upper?(string) }
		validate(&condition)
	end
	
	# a string must not contain any Em words?
	def self.no_em
		condition = -> (string) { RegularExpressionManager::no_em?(string) }
		validate(&condition)
	end
end