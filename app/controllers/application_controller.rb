class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionManager

  def postConnectTo(klass: ,func: , args:)
    klass.send(func, args)
  rescue StandardError => ex
    raise ex
  end
end
