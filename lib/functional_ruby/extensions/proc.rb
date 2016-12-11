require 'functional_ruby/modules/composable_function'
require 'functional_ruby/modules/lift_array'

##
## an extension of Proc class
##

class Proc

	###
	## Mix-in
	#

	include ComposableFunction,  LiftArray

	###
	## alias methods
	#

	alias_method :<, :call

end