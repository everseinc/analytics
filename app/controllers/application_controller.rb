class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionManager

  def postConnectTo(klass: ,func: , args:)
  	if args
    	res = klass.send(func, args)
    else
    	res = klass.send(func)
    end
    return res
  rescue StandardError => ex
  	flash[:danger] = ex.message
  	return false
  end
end
