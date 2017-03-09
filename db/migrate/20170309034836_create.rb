class Create < ActiveRecord::Migration[5.0]
  def change
    create_table :project_paths do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.timestamps
    end
  end
end
