##
## a module for functor
##

module Functor

	###
	## instance methods
	#

  def map
  	raise Fatal::MustOverrideError.code(15052)
  end
end