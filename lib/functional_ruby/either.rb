##
## a class for Either
##

class Either

  ###
  ## Mix-in
  #

  include Functor, Applicative, Monad


  ###
  ## reader properties
  #

  attr_reader :left, :right


  ###
  ## initializer
  #

  def initialize(left, right)
    @left = left
    @right = right
  end


  ###
  ## class methods
  #

  def self.left(left)
    new(left, nil)
  end

  def self.right(right)
    new(nil, right)
  end


  ###
  ## instance methods
  #

  # override a method in Functor module
  def map(block)
    return self if left?
    return Either.right block.call(right) if right?
  end

  # override a method in Applicate module
  def applicate(functors)
    raise Fatal::InvalidArgumentError.code(13001) unless functors.is_a?(Either)

    return self if left?
    return self if functors.left?

    Either.right right.call(functors.right)
  end

  # override a method in Monad module
  def bind(block)
    return self if left?

    begin
      ret = block.call(right, Either)
    rescue StandardError => e
      return self.class.left e
    end

    raise Fatal::MustBindMaybeError.code(15000) unless ret.is_a?(Either)

    ret
  end

  def left?
    !!left
  end

  def right?
    not left?
  end


  def inspect
    return "Left #{left}" if left?
    return "Right #{right}" if right?
  end
end