require 'functional_ruby/modules/applicative'

##
## an extension of Array class
##

class Array

	###
	## Mix-in
	#

	include Applicative


	###
	## instance methods
	#

  def applicate(functors)
    self.flat_map { |f| functors.map(&f) }
  end


  ###
  ## alias methods
  #

  alias_method :>, :applicate
end