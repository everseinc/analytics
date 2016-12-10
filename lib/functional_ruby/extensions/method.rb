require 'functional_ruby/modules/composable_function'

##
## an extension of Method class
##

class Method

	###
	## Mix-in
	#

	include ComposableFunction


	###
	## class methods
	#

	def self.proc_curry(symbol, curry)
		symbol.to_proc.curry(curry)
	end
end