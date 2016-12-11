class CustomersController < ApplicationController
  def new
  	f = -> (value, monad) { monad.right value + 10 }
  	g = -> (value, monad) { monad.right value * 2 }
  	h = -> (value, monad) { monad.left Minor::ArgumentError.code(10000) }
  	@test = Either.right(100) >> f >> h >> g
    @form = CustomerForm.new
  end
end
