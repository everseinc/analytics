class ApiController < ApplicationController

	###
	## before action
	#
	
  rescue_from Exception, with: :error_handle


  ###
  ## private method
  #

  private

  def error_handle(ex = nil)
		render :json => {
			result: 'error',
			error_message: ex.message
		} if ex
  end
end
