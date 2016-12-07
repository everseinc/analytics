module LiftArray
  def lift(functors)
    functors.map(&self)
  end

    def self.included(klass)
    klass.send(:alias_method, :<=, :lift)
  end
end

Proc.send(:include, LiftArray)