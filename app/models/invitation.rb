class Invitation < ApplicationRecord

  ###
  ## class methods
  #

  class << self


    ###
    ## invite to application
    #

		def invite(email, app_id)
			uuid = SecureRandom.hex(6)
			limited_at = Time.current.since( 24 * 60 * 60 )

			invitation = self.new(email: email, uuid: uuid, app_id: app_id ,limited_at: limited_at)
			raise Major::SaveFailedError.code(21007) if !invitation.save
			invitation
		end


    ###
    ## check
    #

		def check(email, uuid, app_id)
			invitation = find_by(email: email)
			now = Time.current
			return false if !invitation
			return false if invitation[:uuid] != uuid
			return false if invitation[:app_id] != app_id
			return false if invitation[:limited_at] < now
			true
		end
	end
end
