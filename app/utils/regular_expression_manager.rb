##
## a class for managing regular expressions
##

class RegularExpressionManager

	###
	## class methods
	#

	# applay replacement by a regular expression for a string array
	def self.array_gsub(array, pattern, replacement)
		Method.proc_curry(:gsub, 3) <= array > pattern > replacement
	end

	# does a string contain only numbers?
	def self.only_number?(string)
		/^[0-9]+$/ === string
	end

	# does not a string contain any numbers?
	def self.no_number?(string)
		/^[^0-9]+$/ === string
	end

	# does a string contain only lowercases?
	def self.only_lower?(string)
		/^[a-z]+$/ === string
	end

  # does a string contain not only blank?
	def self.no_blank?(string)
		/^[^\s]+$/ === string
	end

	# does not a string contain only lowercases?
	def self.no_lower?(string)
		/^[^a-z]+$/ === string
	end

	# does a string contain only uppercases?
	def self.only_upper?(string)
		/^[A-Z]+$/ === string
	end

	# does not a string contain any uppercases?
	def self.no_upper?(string)
		/^[^A-Z]+$/ === string
	end

	# does not a string contain any Em words?
	def self.no_em?(string)
		/^[ -~。-゜]+$/ === string
	end

	# is a string valid for an email address?
	def self.is_email?(string)
		/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i === string
	end

	# is a string valid for an URL?
	def self.is_url?(string)
		/\A#{URI::regexp(%w(http https))}\z/ === string
	end

	def self.is_emo_formula?(string)
 		true
	end
end