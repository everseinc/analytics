##
## a module for composing two functions
##

module ComposableFunction

	###
	## instance methods
	#

  def >=(g)
    ->(x) {
      res = self.to_proc.call(x)
      res && g.to_proc.call(res)
    }
  end
end