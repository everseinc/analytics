class ApplicationController < ActionController::Base
	include SessionManager


	###
	## properties
	#

  protect_from_forgery with: :exception
  before_filter :set_request_filter


  ###
  ## shared methods
  #

  def postConnectTo(klass: ,func: , args:)
  	if args
    	res = klass.send(func, args)
    else
    	res = klass.send(func)
    end

    if res.is_a?(FlashManager)
    	flash.merge!(res.get_flash)
    	return false
    end

    return res
  rescue StandardError => ex
  	flash[:danger] = ex.message
  	return false
  end

  def set_request_filter
	  Thread.current[:request] = request
	end
end
