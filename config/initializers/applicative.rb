module Applicative
  def applicate(functors)
    self.flat_map { |f| functors.map(&f) }
  end

    def self.included(klass)
    klass.send(:alias_method, :>, :applicate)
  end
end

Array.send(:include, Applicative)