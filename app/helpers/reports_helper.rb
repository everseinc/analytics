module ReportsHelper
	def check_accordion_activation
		return :default if default.include? action_name
		return :dimension if dimension.include? action_name
		return :setting if setting.include? action_name
	end

	def report_link_to(name, link_path)
		option = {}
		option[:class] = "selected" if link_path[:action] == action_name

		link_to name, link_path, option
	end

	def default
		["time", "dimension", "key"]
	end

	def dimension
		["dimension_all"]
	end

	def setting
		[]
	end

	def key_list_test(key)
		html = "<label class='key-option-label'>
			<input class='key-option-check' type='checkbox' name='任意' value='#{key}' />
			#{key}
		</label>"
		html.html_safe
	end
end