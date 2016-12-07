class Method
	def self.proc_curry(symbol, curry)
		symbol.to_proc.curry(curry)
	end
end