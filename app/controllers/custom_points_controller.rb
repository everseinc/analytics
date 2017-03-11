class CustomPointsController < MainLayoutController
  include Concerns::Filters::CustomPointsSetters
  include Concerns::Filters::AuthAction


  def index
    render :file => "/configs/custom_points/index"
  end
end