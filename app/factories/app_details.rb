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
      admin_auth_id = Authority.find_by(name: 'Admin').id
      if app.valid? && customer.valid?
        ActiveRecord::Base.transaction do
          app.save!
          AppsCustomer.create(app_id: app.id, customer_id: customer.id, authority_id: admin_auth_id)
        end
      else
        flash = FlashManager.new({})
        flash.set_flash(app.errors.full_messages)
        return flash
      end

      app
    end
  end

end