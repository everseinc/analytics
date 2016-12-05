class TestController < MainLayoutController
  def index
  	@test = "hiiss"
  	begin
  		raise MajorError::Base.code(10)
  	rescue MajorError::Base => e
  		@test = "Exception handled! #{e.message}"
  	end
  end
end