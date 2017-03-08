class ReportsController < MainLayoutController

  include Concerns::Filters::AuthAction
  include Concerns::Filters::ReportsSetters

  def show

     @report = ReportDetails.new(project_id: params[:project_id])

    if request.xhr?
      @page_partial = "#{params[:i1]}/#{params[:i2]}"
      render 'load'
    end

  end


  ###
  ## Ajax
  #

  def load
  end
end
