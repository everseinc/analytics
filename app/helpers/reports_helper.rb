module ReportsHelper
	def check_accordion_activation
		return :default if default.include? action_name
		return :setting if setting.include? action_name
	end

	def report_link_to(name, link_path)
		option = {}
		option[:class] = "selected" if link_path[:action] == action_name

		link_to name, link_path, option
	end

	def default
		["time", "dimension"]
	end

	def setting
		[]
	end
end
