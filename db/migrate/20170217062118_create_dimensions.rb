class CreateDimensions < ActiveRecord::Migration[5.0]
  def change
    create_table :dimensions do |t|
      t.integer :project_id, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
