class TestController < MainLayoutController
  def index
  	@test = "hello"

  	@test2 = square_sum [:hi, :hello, :yes, :good]
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
end