class ApiController < ApplicationController

	###
	## before action
	#
	
  rescue_from Exception, with: :error_handle


  # api gateway
  def apiConnectTo(klass: ,func: , args:)
  	if args
    	res = klass.send(func, args)
    else
    	res = klass.send(func)
    end

    if MissionFlow.instance.failure?
      raise Major::SaveFailedError.new(MissionFlow.instance.flash.to_s)
    end

    res
  end


  ###
  ## private method
  #

  private

  def error_handle(ex = nil)
		render :json => {
			result: 'error',
			error_message: ex.message,
			error_backtrace: ex.backtrace
		} if ex
  end
end
