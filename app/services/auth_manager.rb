##
## a class for managing auth
##

class AuthManager

	###
	## class methods
	#

	class << self

		def authenticate_by_customer_id(id)
			if id.to_i == session[:customer_id]
				return true
			else
				return false
			end
		end

		def authenticate_by_write_app_customer_id(id)
			apps_customer = AppsCustomer.find_by(app_id: id, customer_id: session[:customer_id])
			return false if apps_customer.nil?
			if apps_customer.authority.name == "Admin" || apps_customer.authority.name == "Write"
				return true
			else
				return false
			end
		end

		def authenticate_by_write_project_customer_id(id)
		  customers_project = CustomersProject.find_by(project_id: id, customer_id: session[:customer_id])
			return false if customers_project.nil?
			if customers_project.customer_authority == "Admin" || customers_project.customer_authority == "Write"
				return true
			else
				return false
			end
		end



		def authenticate_by_app_id(id)
			apps_customer = AppsCustomer.find_by(app_id: id, customer_id: session[:customer_id])
			if apps_customer
				return true
			else
				return false
			end
		end

		def authenticate_by_project_id(id)
			customer = Customer.find(session[:customer_id])
			project = Project.find(id)
			if project.apps[0].customers[0].id == customer.id
				return true
			else
				return false
			end
		end

		def session
			Thread.current[:request].session
		end

	end
end