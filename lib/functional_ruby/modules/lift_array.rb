##
## a module for a fanctor's syntax suger
##

module LiftArray

	###
	## instance methods
	#

  def lift(functors)
    functors.map(&self)
  end


  ###
  ## alias methods
  #

  alias_method :<=, :lift

end