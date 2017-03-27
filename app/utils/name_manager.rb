##
## a class for managing regular expressions
##

class NameManager

	###
	## class methods
	#
	
	class << self

		def initial_upper(name)
			if RegularExpressionManager::only_lower?(name[0])
				return name[0].upcase
			else
				name.slice!(0)
				initial_upper name 
			end
		end
	end
end