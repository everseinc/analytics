class CreateCustomersProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :customers_projects do |t|
      t.integer :customer_id, null: false
      t.foreign_key :customers, dependent: :delete, name: "customers_projects_customer_id"
      t.integer :project_id, null: false
      t.foreign_key :projects, dependent: :delete, name: "customers_projects_project_id"
      t.string :customer_authority, null: false
      t.timestamps
    end
    add_index :customers_projects, [ :customer_id, :project_id ], unique: true


  end
end
