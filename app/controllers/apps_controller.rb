class AppsController < MainLayoutController

  include Concerns::Resources::AppsResources
  include Concerns::Filters::AppsSetters
  include Concerns::Filters::AuthAction

  ###
  ## GET
  #

  def join
    goto = "#{Settings.hostname}/apps/#{params[:app_id]}"

    if logged_in? && Invitation.check(current_customer[:email], params[:key], params[:app_id])
      AppsCustomer.create_writer(params[:app_id], current_customer.id)
      redirect_to goto and return
    else

    redirect_to login_path(:key => params[:key], :app_id => params[:app_id]) and return
    end
  end


  ###
  ## POST
  #

  def create
  	res = postConnectTo(klass: AppForm, func: "save", args: app_form_params)
    if res
      redirect_to app_path(res)
    else
      redirect_to :action => 'new'
    end
  end

  def update
    res = postConnectTo(klass: App, func: "update_name", args: app_params)
    if res
      redirect_to app_path(res)
    else
      redirect_to :action => 'edit'
    end
  end


  ###
  ## strong parameters
	#

	private

	def app_form_params
		params[:app_form].permit(:app_name)
	end

  def app_params
    params[:app].permit(:id, :app_name)
  end
end
