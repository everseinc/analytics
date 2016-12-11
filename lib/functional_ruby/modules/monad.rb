##
## a class for monad
##

module Monad

	###
	## instance methods
	#

  def bind(block)
  	raise Fatal::MustOverrideError.code(15050)
  end

  def >>(block)
  	bind(block)
  end
end