module Concerns::Gateways::ApplicationGateways

	###
  ## private methods
  #

  private


	def on_success
		yield if MissionFlow.instance.success?
	end
end