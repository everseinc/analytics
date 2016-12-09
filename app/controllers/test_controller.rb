class TestController < MainLayoutController
  def index
    @test = :gsub.to_proc.curry(3) <= ["hi", "hello"] > [/h/] > ["f"]
    @test2 = "test2"
    half = -> (value, monad) { monad.new(value / 2) }
    @test3 = Maybe.new(20) >> half >> half >> half

    @validation1 = Maybe.new("keijinamba") >> StringValidator.not_empty >> StringValidator.only_lower
    #=> Just keijinamba

    @validation2 = Maybe.new("keijinamba") >> StringValidator.not_empty >> StringValidator.email_format
    #=> Nothing

    @validation3 = Maybe.new("keijinamba@info.com") >> StringValidator.not_empty >> StringValidator.email_format
    #=> Just keijinamba@info.com

    flash[:notice] = "hihi"
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