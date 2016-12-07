##
## a class for Maybe
##

class Maybe < Monad

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

  def self.map(&block)
    -> (r) {
      case
      when r.just? then new block.call(r.value)
      when r.nothing? then zero
      end
    }
  end


  ###
  ## instance methods
  #

  def bind(&block)
    return Maybe.zero if nothing?
      
    ret = block.call @value, Maybe
    raise FatalError::Maybe::MustBindMaybeError.code(15000) unless ret.is_a?(Maybe)
    ret
  end

  def map(&block)
    return zero if nothing?
    return Maybe.new block.call(value) if just?
  end

  def applicate(functors)
    return zero if nothing?
    return zero if functors.nothing?

    Maybe.new value.call(functors.value)
  end

  def +(n)
    if n.just?
      n
    else
      self
    end
  end

  def nothing?
    value.nil?
  end

  def just?
    not nothing?
  end

  def inspect
    if just?
      "Just #{value}"
    else
      "Nothing"
    end
  end


  ###
  ## alias
  #

  alias_method :>, :applicate
end