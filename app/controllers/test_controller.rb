class TestController < MainLayoutController
  def index
  	@test = "hello"

  	begin
  		raise MajorError::Base.code(10000)
  	rescue MajorError::Base => e
  		@test = e.message
  	end
  end
end