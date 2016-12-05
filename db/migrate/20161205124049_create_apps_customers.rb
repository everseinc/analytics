class CreateAppsCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :apps_customers do |t|
      t.integer  :app_id, null: false
      t.foreign_key :apps, dependent: :delete, name: "apps_customers_app_id"
      t.integer  :customer_id, null: false
      t.foreign_key :customers, dependent: :delete, name: "apps_customers_customer_id"
      t.string :customer_authority, null: false
      t.timestamps
    end
    add_index :apps_customers, [ :customer_id, :app_id ], unique: true
  end
end
