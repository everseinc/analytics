module ComposableFunction
  def >=(g)
    ->(x) do
      res = self.call(x)
      return nil if res.nil?
      g.call(res)
    end
  end
end

[Proc, Method, Symbol].each do |klass|
  klass.send(:include, ComposableFunction)
end