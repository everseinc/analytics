module ApplicationHelper
	def simple_button(str, id)
			html = "<button type='button' id='#{id}' class='simple-button'>#{str}</button>"
			html.html_safe
	end
end
