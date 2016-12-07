class AddNameToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :name, :string, null:false
  end
end
