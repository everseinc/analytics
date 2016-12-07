##
## a class for managing regular expressions
##

class RegularExpressionManager

	###
	## class methods
	#

	# applay replacement by a regular expression for a string array
	def self.array_gsub(array, pattern, replacement)
		f = -> (pattern, replacement, value) {
			return value.to_s.gsub(pattern, replacement) if value.kind_of?(String)
			value
		}

		array.map &f.curry.(pattern).(replacement)
	end

	# does a string contain only numbers?
	def self.only_number?(string)
		/^[0-9]+$/ === string
	end

	# does not a string contain any numbers?
	def self.no_number?(string)
		/^[^0-9]+$/ === string
	end

	# does not a string contain any Em words?
	def self.no_em?(string)
		/^[ -~。-゜]+$/ === string
	end

	# is a string valid for an email address?
	def self.is_email?(string)
		/\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/ === string
	end
end