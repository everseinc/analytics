##
## a class for Maybe
##

class Maybe

  ###
  ## Mix-in
  #

  include Functor, Applicative, Monad


  ###
  ## reader properties
  #

  attr_reader :value


  ###
  ## initializer
  #

  def initialize(value)
    @value = value
  end


  ###
  ## class methods
  #

  def self.zero
    Maybe.new(nil)
  end


  ###
  ## instance methods
  #

  # override a method in Functor module
  def map(block)
    return zero if nothing?
    return Maybe.new block.call(value) if just?
  end

  # override a method in Applicate module
  def applicate(functors)
    raise Fatal::InvalidArgumentError.code(13000) unless functors.is_a?(Maybe)

    return zero if nothing?
    return zero if functors.nothing?

    Maybe.new value.call(functors.value)
  end

  # override a method in Monad module
  def bind(block)
    return zero if nothing?
      
    ret = block.call(@value, Maybe)

    raise Fatal::MustBindMaybeError.code(15000) unless ret.is_a?(Maybe)

    ret
  end

  def nothing?
    value.nil?
  end

  def just?
    not nothing?
  end

  def inspect
    return "Just #{value}" if just?
    return "Nothing" if nothing?
  end
end