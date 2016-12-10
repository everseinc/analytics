##
## a module for fanctor
##

module Fanctor

	###
	## instance methods
	#

  def map
  	raise Fatal::MustOverrideError.code(15052)
  end
end