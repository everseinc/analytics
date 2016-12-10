##
## a module for applicative
##

module Applicative

	###
	## instance methods
	#

  def applicate(fanctor)
  	raise Fatal::MustOverrideError.code(15051)
  end

  def >(fanctor)
    applicate(fanctor)
  end
end