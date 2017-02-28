class ChangeCustomerAuthorityToAppsCustomers < ActiveRecord::Migration[5.0]
  def up
  	rename_column :apps_customers, :customer_authority, :authority_id
    change_column :apps_customers, :authority_id, :integer, null: false
  end

  def down
    change_column :apps_customers, :authority_id, :string, null: false
    rename_column :apps_customers, :authority_id, :customer_authority
  end
end
