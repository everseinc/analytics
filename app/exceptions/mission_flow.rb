##
## ** Singleton **
## a class for indicating processing flow of all missions in one request
##

class MissionFlow

  ###
  ## status enum
  #

  STATUSE = {
    success: 1,
    failure: 0
  }


  ###
  ## properties
  #

  attr_accessor :flash
  attr_reader :status


  ## create Singleton
  ## this singleton is alive through one request
  def self.instance
    Thread.current['request-singleton'] ||= MissionFlow.new
  end

  ## delete Singleton
  ## this singleton must eb deleted at the end of one request
  def self.clear
    Thread.current['request-singleton'] = nil
  end


	###
	## initializer
	#

  def initialize()
    @status = 1
    @flash = FlashManager.new({})
  end


  ## flash setter
  ## add a flash by using FlashManager through Maybe
  def <<(hash)
    @flash.set_flash(hash)
  end


  ## flash getter
  ## clear empty hash and unwrap Maybe
  def flash
    return @flash.get_flash
  end




  ## status setter
  ## status must be only 0 or 1 that means success or failure like enum
  def status=(int)
    if not STATUSE.select { |k, v| v == int }
      raise Fatal::InvalidArgumentError.code(13002)
    end
    @status = int
  end


  ## status key getter
  ## get status name from STATUS key
  def status_name
    STATUSE.key(@status)
  end


  ## status checker
  def success?
    @status == STATUSE[:success]
  end

  def failure?
    @status == STATUSE[:failure]
  end
end