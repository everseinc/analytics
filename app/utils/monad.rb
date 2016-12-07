##
## a class for monad
##

class Monad

	###
	## instance methods
	#

  def *(m)
    bind { m }
  end

  def join
    bind { |r| r }
  end
end

