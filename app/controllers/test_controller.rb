class TestController < MainLayoutController
  def index
    int = Maybe.new(10)
    plus = :+.to_proc.curry(2)
    num = Maybe.new(5)
    # f = -> n { n * 10 }
    @test = plus <= num > int
    @test2 = "test2"
  end


  ###
  ## private methods
  #

  private
  def square_sum(arr)

  	# 関数型ぽくない
  	sum1 = []
  	for symbol in arr do
  		sum1 << symbol.to_s.upcase
  	end

  	#関数型ぽい
  	sum2 = arr.map { |symbol|
  		symbol.to_s.upcase
  	}

  	#関数型
    # <<メソッドは config/initializer/composable_functions.rbで定義
    # 関数Procを受け取って、自身（関数Proc）との合成関数を返す関数
  	sum3 = arr.map &:to_s << :upcase

  	@sum1 = sum1
  	@sum2 = sum2
  	@sum3 = sum3
  end

  def test
    f = -> (arr) { arr.first }
    g = -> (x) { x + 1 }
    h = -> (x) { x * 2 }

    i = f >= g >= h

    @hi = i.([12,23,33])
  end
end