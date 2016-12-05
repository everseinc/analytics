##
## a class for the most basic one of any custom classes
##

class CustomError < StandardError

	###
	## initializer
	#

  def initialize(code, message)
    @code = code
    super("[#{code}] - #{message}")
  end


  ###
  ## class mothods
  #

  def self.exception(code, message)
    self.new(code, message)
  end

  def self.code(code)
  	self.new(code, get_message(code))
  end

  def self.get_message(code)
  	yaml = YAML.load_file("#{Rails.root}/app/exceptions/error_code.yml")
  	yaml[code]
  end
end