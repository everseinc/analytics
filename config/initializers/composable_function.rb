module ComposableFunction
  def compose(g)
    lambda{|*args| self.to_proc.call(g.to_proc.call(*args)) }
  end

  def >>(g)
    g << self
  end

  def self.included(klass)
    klass.send(:alias_method, :<<, :compose)
  end
end

[Proc, Method, Symbol].each do |klass|
  klass.send(:include, ComposableFunction)
end