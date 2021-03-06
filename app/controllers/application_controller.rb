class ApplicationController < ActionController::Base
	include SessionManager


	###
	## properties
	#

  protect_from_forgery with: :exception
  before_action :set_request_filter
  after_action :delete_mission_flow


  ###
  ## shared methods
  #

  def postConnectTo(klass: ,func: , args:)
  	if args
    	res = klass.send(func, args)
    else
    	res = klass.send(func)
    end

    if MissionFlow.instance.failure?
      flash.merge!(MissionFlow.instance.flash)
      return false
    end

    if res.is_a?(FlashManager)
    	flash.merge!(res.get_flash)
    	return false
    end
    return res

  rescue Major::BaseError => ex
  	flash[:danger] = ex.message
  	return false
  end


  ## ** Not Recommended **
  ## You can use session in Model and Other Classes on the same thread
  def set_request_filter
	  Thread.current[:request] = request
	end


  ## delete MissionFlow Singleton at the end of one request
  def delete_mission_flow
    MissionFlow.clear
  end


  ## Usage
  ## 
  ## default : Default url to redirect
  ## goto (of params) : You can change redirecting url dynamically by giving :goto param in posted url
  ## You can give a block because you want to use some parameters of a reciever
  def dynamic_redirect_to(default)
    
    if block_given?
      yield
    end

    if !params[:goto]
      redirect_to default and return
    end

    redirect_to params[:goto] and return
  end
end
