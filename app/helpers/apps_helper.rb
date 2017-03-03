module AppsHelper
	def find_by_ids(app_id, customer_id)
		AppDetails.find_by_ids(app_id, customer_id)
	end
end
