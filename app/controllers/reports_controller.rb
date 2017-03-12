class ReportsController < MainLayoutController

  include Concerns::Filters::AuthAction
  include Concerns::Filters::ReportsSetters

  def show
    redirect_to :action => "time"
  end

  def time
  end

  def dimension
  end
end
