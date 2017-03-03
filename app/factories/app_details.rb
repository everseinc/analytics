class AppDetails
  include ActiveModel::Model
  attr_accessor :app_name, :customer_authority

  ###
  ## class methods
  #

  class << self

    def find_by_ids(app_id, customer_id)
      app = App.find(app_id)
      customer = Customer.find(customer_id)
      apps_customer = AppsCustomer.find_by(app_id: app_id, customer_id: customer_id)
      result = {
        app: app.attributes,
        customer: customer.attributes,
        authority: apps_customer.authority.attributes
      }
    end

    def save(new_app)
      session = Thread.current[:request].session
    	app = App.new(app_name: new_app[:app_name])
    	customer = Customer.find(session[:customer_id])
      if app.valid? && customer.valid?
        ActiveRecord::Base.transaction do
          app.save!
          AppsCustomer.create(app_id: app.id, customer_id: customer.id, customer_authority: new_app[:customer_authority])
        end
      else
        er_messages = []
        er_messages << app.errors.full_messages
        er_messages.delete([])
        return er_messages
      end

      app
    end
  end

end